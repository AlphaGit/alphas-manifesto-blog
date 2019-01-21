---
layout: post
title: Crear sitios de SharePoint programáticamente
date: '2011-05-11 03:19:26 +0000'
date_gmt: '2011-05-11 05:19:26 +0000'
categories:
- Projects
- Technology
tags:
- automatización
- C#
- desarrollo
- SharePoint
- métodos de extensión
- singleton
---

## El objetivo

Estuve peleando estos días con la posibilidad de crear sitios de SharePoint programáticamente desde mi código. Sin embargo, aún cuando esto fue hecho para un proyecto interno, tomé tanto de la internet que realmente siento que debo devolver algo a la comunidad. Además, no voy a divulgar nada relacionado al proyecto, así que aquí vamos.

Primero, buscando en internet una forma de crear estos sitios programáticamente, me topé con un artículo del 2007 de WinSmarts.com, llamado [Programatically create a Sharepoint site based on a site definition](http://blah.winsmarts.com/2007-5-Programatically_create_a_SharePoint_site_based_on_a_site_definition.aspx). Aquí está el código de ese post:

```csharp
public static bool CreateSite(string parentSiteURL, string siteURLRequested,
    string siteTitle, string siteTemplateName)
{
    bool returnCondition = false; // Assume failure.
    const Int32 LOCALE_ID_ENGLISH = 1033;
    using (SPSite siteCollection = new SPSite(parentSiteURL))
    {
        SPWeb parentWeb = siteCollection.OpenWeb();
        SPWebTemplateCollection Templates = siteCollection.GetWebTemplates(Convert.ToUInt32(LOCALE_ID_ENGLISH));
        SPWebTemplate siteTemplate = Templates[siteTemplateName];
        if (parentWeb.Webs[siteURLRequested].Exists)
        {
            parentWeb.Webs.Delete(siteURLRequested);
        }
        parentWeb.Webs.Add(siteURLRequested, siteTitle, "", Convert.ToUInt32(LOCALE_ID_ENGLISH), siteTemplate, false, false);

        // All is good?
        returnCondition = true;
    }
    return returnCondition;
}
```

Lo que yo quería cambiar de esta solución era:

- Los Locales estaban hardcodeados
- Los Site templates estaban hardcodeados
- La descripción del sitio estaba hardcodeado (esa es la cadena vacía en la llamada a webs.add)

## Removiendo literales...

Entonces fui a revisar la lista de locales: [SharePoint Locale ID (LCID) Table](http://grounding.co.za/blogs/brett/archive/2008/04/09/sharepoint-locale-id-lcid-table.aspx), y una lista de los identificadores de site templates, en un artículo llamado [Create a site programmatically in moss](http://www.sharepointkings.com/2009/02/create-site-programmatically-in-moss.html).

Bueno... aquí vamos (cuidado, vienen enumeraciones largas):

```csharp
public enum SPLocales: uint
{
	Afrikaans /*af*/ = 1078,
	Albanian /*sq*/ = 1052,
	Arabic_UnitedArabEmirates /*ar-ae*/ = 14337,
	Arabic_Bahrain /*ar-bh*/ = 15361,
	Arabic_Algeria /*ar-dz*/ = 5121,
	Arabic_Egypt /*ar-eg*/ = 3073,
	Arabic_Iraq /*ar-iq*/ = 2049,
	Arabic_Jordan /*ar-jo*/ = 11265,
	Arabic_Kuwait /*ar-kw*/ = 13313,
	Arabic_Lebanon /*ar-lb*/ = 12289,
	Arabic_Libya /*ar-ly*/ = 4097,
	Arabic_Morocco /*ar-ma*/ = 6145,
	Arabic_Oman /*ar-om*/ = 8193,
	Arabic_Qatar /*ar-qa*/ = 16385,
	Arabic_SaudiArabia /*ar-sa*/ = 1025,
	Arabic_Syria /*ar-sy*/ = 10241,
	Arabic_Tunisia /*ar-tn*/ = 7169,
	Arabic_Yemen /*ar-ye*/ = 9217,
	Armenian /*hy*/ = 1067,
	Azeri_Latin /*az-az*/ = 1068,
	Azeri_Cyrillic /*az-az*/ = 2092,
	Basque /*eu*/ = 1069,
	Belarusian /*be*/ = 1059,
	Bulgarian /*bg*/ = 1026,
	Catalan /*ca*/ = 1027,
	Chinese_China /*zh-cn*/ = 2052,
	Chinese_HongKongSAR /*zh-hk*/ = 3076,
	Chinese_MacauSAR /*zh-mo*/ = 5124,
	Chinese_Singapore /*zh-sg*/ = 4100,
	Chinese_Taiwan /*zh-tw*/ = 1028,
	Croatian /*hr*/ = 1050,
	Czech /*cs*/ = 1029,
	Danish /*da*/ = 1030,
	Dutch_TheNetherlands /*nl-nl*/ = 1043,
	Dutch_Belgium /*nl-be*/ = 2067,
	English_Australia /*en-au*/ = 3081,
	English_Belize /*en-bz*/ = 10249,
	English_Canada /*en-ca*/ = 4105,
	English_Caribbean /*en-cb*/ = 9225,
	English_Ireland /*en-ie*/ = 6153,
	English_Jamaica /*en-jm*/ = 8201,
	English_NewZealand /*en-nz*/ = 5129,
	English_Phillippines /*en-ph*/ = 13321,
	English_SouthAfrica /*en-za*/ = 7177,
	English_Trinidad /*en-tt*/ = 11273,
	English_UnitedKingdom /*en-gb*/ = 2057,
	English_UnitedStates /*en-us*/ = 1033,
	Estonian /*et*/ = 1061,
	Farsi /*fa*/ = 1065,
	Finnish /*fi*/ = 1035,
	Faroese /*fo*/ = 1080,
	French_France /*fr-fr*/ = 1036,
	French_Belgium /*fr-be*/ = 2060,
	French_Canada /*fr-ca*/ = 3084,
	French_Luxembourg /*fr-lu*/ = 5132,
	French_Switzerland /*fr-ch*/ = 4108,
	Gaelic_Ireland /*gd-ie*/ = 2108,
	Gaelic_Scotland /*gd*/ = 1084,
	German_Germany /*de-de*/ = 1031,
	German_Austria /*de-at*/ = 3079,
	German_Liechtenstein /*de-li*/ = 5127,
	German_Luxembourg /*de-lu*/ = 4103,
	German_Switzerland /*de-ch*/ = 2055,
	Greek /*el*/ = 1032,
	Hebrew /*he*/ = 1037,
	Hindi /*hi*/ = 1081,
	Hungarian /*hu*/ = 1038,
	Icelandic /*is*/ = 1039,
	Indonesian /*id*/ = 1057,
	Italian_Italy /*it-it*/ = 1040,
	Italian_Switzerland /*it-ch*/ = 2064,
	Japanese /*ja*/ = 1041,
	Korean /*ko*/ = 1042,
	Latvian /*lv*/ = 1062,
	Lithuanian /*lt*/ = 1063,
	FYRO_Macedonian /*mk*/ = 1071,
	Malay_Malaysia /*ms-my*/ = 1086,
	Malay_Brunei /*ms-bn*/ = 2110,
	Maltese /*mt*/ = 1082,
	Marathi /*mr*/ = 1102,
	Norwegian_Bokmal /*no-no*/ = 1044,
	Norwegian_Nynorsk /*no-no*/ = 2068,
	Polish /*pl*/ = 1045,
	Portuguese_Portugal /*pt-pt*/ = 2070,
	Portuguese_Brazil /*pt-br*/ = 1046,
	Raeto_Romance /*rm*/ = 1047,
	Romanian_Romania /*ro*/ = 1048,
	Romanian_RepublicOfMoldova /*ro-mo*/ = 2072,
	Russian /*ru*/ = 1049,
	Russian_RepublicOfMoldova /*ru-mo*/ = 2073,
	Sanskrit /*sa*/ = 1103,
	Serbian_Cyrillic /*sr-sp*/ = 3098,
	Serbian_Latin /*sr-sp*/ = 2074,
	Setsuana /*tn*/ = 1074,
	Slovenian /*sl*/ = 1060,
	Slovak /*sk*/ = 1051,
	Sorbian /*sb*/ = 1070,
	Spanish_Spain /*es-es*/ = 1034,
	Spanish_Argentina /*es-ar*/ = 11274,
	Spanish_Bolivia /*es-bo*/ = 16394,
	Spanish_Chile /*es-cl*/ = 13322,
	Spanish_Colombia /*es-co*/ = 9226,
	Spanish_CostaRica /*es-cr*/ = 5130,
	Spanish_DominicanRepublic /*es-do*/ = 7178,
	Spanish_Ecuador /*es-ec*/ = 12298,
	Spanish_Guatemala /*es-gt*/ = 4106,
	Spanish_Honduras /*es-hn*/ = 18442,
	Spanish_Mexico /*es-mx*/ = 2058,
	Spanish_Nicaragua /*es-ni*/ = 19466,
	Spanish_Panama /*es-pa*/ = 6154,
	Spanish_Peru /*es-pe*/ = 10250,
	Spanish_PuertoRico /*es-pr*/ = 20490,
	Spanish_Paraguay /*es-py*/ = 15370,
	Spanish_ElSalvador /*es-sv*/ = 17418,
	Spanish_Uruguay /*es-uy*/ = 14346,
	Spanish_Venezuela /*es-ve*/ = 8202,
	Sutu /*sx*/ = 1072,
	Swahili /*sw*/ = 1089,
	Swedish_Sweden /*sv-se*/ = 1053,
	Swedish_Finland /*sv-fi*/ = 2077,
	Tamil /*ta*/ = 1097,
	Tatar /*tt*/ = 1092,
	Thai /*th*/ = 1054,
	Turkish /*tr*/ = 1055,
	Tsonga /*ts*/ = 1073,
	Ukrainian /*uk*/ = 1058,
	Urdu /*ur*/ = 1056,
	Uzbek_Cyrillic /*uz-uz*/ = 2115,
	Uzbek_Latin /*uz-uz*/ = 1091,
	Vietnamese /*vi*/ = 1066,
	Xhosa /*xh*/ = 1076,
	Yiddish /*yi*/ = 1085,
	Zulu /*zu*/ = 1077
}

public enum SPSiteTemplates
{
	TeamSite,
	BlankSite,
	DocumentWorkspace,
	BasicMeetingWorkspace,
	BlankMeetingWorkspace,
	DecisionMeetingWorkspace,
	SocialMeetingWorkspace,
	MultiPageMeetingWorkspace,
	Wiki,
	Blog,
	///
<summary>
	/// A central document management location for an enterprise
	/// </summary>

	DocumentCenter,
	///
<summary>
	/// A central location in which records managers can define routes for incoming files
	/// </summary>

	RecordsCenter1,
	RecordsCenter2,
	PublishingSite,
	///
<summary>
	/// A site for publishing web pages on a schedule with workflow features enabled
	/// </summary>

	PublishingSite2,
	PressReleasesSite,
	///
<summary>
	/// A publishing site for web pages using approval workflows
	/// </summary>

	PublishingSiteWithWorkflow,
	///
<summary>
	/// A site for publishing news and articles
	/// </summary>

	NewsSite,
	///
<summary>
	/// A site for creating, managing, and delivering web pages, dashboards, and Key Performance Indicators (KPIs)
	/// </summary>

	ReportCenter,
	///
<summary>
	/// A starter hierarchy for an intranet divisional portal
	/// </summary>

	SPSPortal,
	///
<summary>
	/// A profile site that includes page layouts with zones
	/// </summary>

	ProfileSite,
	///
<summary>
	/// A site collection preconfigured for revision-controlled, secure content creation and publication
	/// </summary>

	PublishingPortal,
	///
<summary>
	/// Keep in mind that only one of these can be provisioned per Shared Services Provider
	/// </summary>

	MySiteHost,
	///
<summary>
	/// A site designed to deliver the search query and results experience
	/// </summary>

	SearchCenter,
	///
<summary>
	/// A superset of the previous; does not appear in navigation bars
	/// </summary>

	SearchCenter2
}
```

### Un poco de magia enum

Lo que nos queda es:

- Convertir enums **SPLocales** a su representación correspondiente en uint
- Convertir enums **SPSiteTemplates** a su representación en cadena correspondientes
- Evitar intentar crear sitios duplicados

Para convertir enums **SPLocales** a su representación uint, sólo tenemos que hacer el casting correspondiente. Esta es la razón por la que hicimos al enum heredar de unit y setear el valor apropiado en cada elemento.

Para poder convertir enums **SPSiteTemplates** a cadenas, el método común es utilizar atributos y reflexión, pero personalmente no me gusta esa forma, así que hice una con diccionarios y métodos de extensión. La idea es proveer al enum la posibilidad de convertirse en una cadena, y estas cadenas de ser parseadas en el enum nuevamente. Para tener este tipo de relación en ambos sentidos, usé la implementación de **BiDictionaryOneToOne ** del usuario de StackOverflow's [Joel in Go](http://stackoverflow.com/users/6091/joel-in-go), en una pregunta de sobre cómo hacer un diccionario buscable key-value y buscable value-key: [Bidirectional 1 to 1 Dictionary in C#](http://stackoverflow.com/questions/268321/bidirectional-1-to-1-dictionary-in-c).

```csharp
public static class SPSiteTemplateMethodExtension
{
	private const string SP_SITE_TEMPLATE_TEAM_SITE = "STS#0";
	private const string SP_SITE_TEMPLATE_BLANK_SITE = "STS#1";
	private const string SP_SITE_TEMPLATE_DOCUMENT_WORKSPACE = "STS#2";
	private const string SP_SITE_TEMPLATE_BASIC_MEETING_WORKSPACE = "MPS#0";
	private const string SP_SITE_TEMPLATE_BLANK_MEETING_WORKSPACE = "MPS#1";
	private const string SP_SITE_TEMPLATE_DECISION_MEETING_WORKSPACE = "MPS#2";
	private const string SP_SITE_TEMPLATE_SOCIAL_MEETING_WORKSPACE = "MPS#3";
	private const string SP_SITE_TEMPLATE_MULTI_PAGE_MEETING_WORKSPACE = "MPS#4";
	private const string SP_SITE_TEMPLATE_WIKI = "WIKI#0";
	private const string SP_SITE_TEMPLATE_BLOG = "BLOG#0";
	private const string SP_SITE_TEMPLATE_DOCUMENT_CENTER = "BDR#0";
	private const string SP_SITE_TEMPLATE_RECORDS_CENTER_1 = "OFFILE#0";
	private const string SP_SITE_TEMPLATE_RECORDS_CENTER_2 = "OFFILE#1";
	private const string SP_SITE_TEMPLATE_PUBLISHING_SITE = "CMSPUBLISHING#0";
	private const string SP_SITE_TEMPLATE_PUBLISHING_SITE_2 = "BLANKINTERNET#0";
	private const string SP_SITE_TEMPLATE_PRESS_RELEASES_SITE = "BLANKINTERNET#1";
	private const string SP_SITE_TEMPLATE_PUBLISHING_SITE_WITH_WORKFLOW = "BLANKINTERNET#2";
	private const string SP_SITE_TEMPLATE_NEWS_SITE = "SPSNHOME#0";
	private const string SP_SITE_TEMPLATE_REPORT_CENTER = "SPSREPORTCENTER#0";
	private const string SP_SITE_TEMPLATE_SPS_PORTAL = "SPSPORTAL#0";
	private const string SP_SITE_TEMPLATE_PROFILE_SITE = "PROFILES#0";
	private const string SP_SITE_TEMPLATE_PUBLISHING_PORTAL = "BLANKINTERNETCONTAINER#0";
	private const string SP_SITE_TEMPLATE_MY_SITE_HOST = "SPSMYSITEHOST#0";
	private const string SP_SITE_TEMPLATE_SEARCH_CENTER = "SRCHCENTERLITE#0";
	private const string SP_SITE_TEMPLATE_SEARCH_CENTER_2 = "SRCHCENTERLITE#1";

	private static BiDictionaryOneToOne<SPSiteTemplates, string> _templates;
	private static BiDictionaryOneToOne<SPSiteTemplates, string> Templates {
		get {
			if (_templates == null) {
				_templates = new BiDictionaryOneToOne<SPSiteTemplates, string>();
				_templates.Add(SPSiteTemplates.BasicMeetingWorkspace, SP_SITE_TEMPLATE_BASIC_MEETING_WORKSPACE);
				_templates.Add(SPSiteTemplates.BlankMeetingWorkspace, SP_SITE_TEMPLATE_BLANK_MEETING_WORKSPACE);
				_templates.Add(SPSiteTemplates.BlankSite , SP_SITE_TEMPLATE_BLANK_SITE);
				_templates.Add(SPSiteTemplates.Blog , SP_SITE_TEMPLATE_BLOG);
				_templates.Add(SPSiteTemplates.DecisionMeetingWorkspace , SP_SITE_TEMPLATE_DECISION_MEETING_WORKSPACE);
				_templates.Add(SPSiteTemplates.DocumentCenter , SP_SITE_TEMPLATE_DOCUMENT_CENTER);
				_templates.Add(SPSiteTemplates.DocumentWorkspace , SP_SITE_TEMPLATE_DOCUMENT_WORKSPACE);
				_templates.Add(SPSiteTemplates.MultiPageMeetingWorkspace , SP_SITE_TEMPLATE_MULTI_PAGE_MEETING_WORKSPACE);
				_templates.Add(SPSiteTemplates.MySiteHost , SP_SITE_TEMPLATE_MY_SITE_HOST);
				_templates.Add(SPSiteTemplates.NewsSite , SP_SITE_TEMPLATE_NEWS_SITE);
				_templates.Add(SPSiteTemplates.PressReleasesSite , SP_SITE_TEMPLATE_PRESS_RELEASES_SITE);
				_templates.Add(SPSiteTemplates.ProfileSite , SP_SITE_TEMPLATE_PROFILE_SITE);
				_templates.Add(SPSiteTemplates.PublishingPortal , SP_SITE_TEMPLATE_PUBLISHING_PORTAL);
				_templates.Add(SPSiteTemplates.PublishingSite , SP_SITE_TEMPLATE_PUBLISHING_SITE);
				_templates.Add(SPSiteTemplates.PublishingSite2 , SP_SITE_TEMPLATE_PUBLISHING_SITE_2);
				_templates.Add(SPSiteTemplates.PublishingSiteWithWorkflow , SP_SITE_TEMPLATE_PUBLISHING_SITE_WITH_WORKFLOW);
				_templates.Add(SPSiteTemplates.RecordsCenter1 , SP_SITE_TEMPLATE_RECORDS_CENTER_1);
				_templates.Add(SPSiteTemplates.RecordsCenter2 , SP_SITE_TEMPLATE_RECORDS_CENTER_2);
				_templates.Add(SPSiteTemplates.ReportCenter , SP_SITE_TEMPLATE_REPORT_CENTER);
				_templates.Add(SPSiteTemplates.SearchCenter , SP_SITE_TEMPLATE_SEARCH_CENTER);
				_templates.Add(SPSiteTemplates.SearchCenter2 , SP_SITE_TEMPLATE_SEARCH_CENTER_2);
				_templates.Add(SPSiteTemplates.SocialMeetingWorkspace , SP_SITE_TEMPLATE_SOCIAL_MEETING_WORKSPACE);
				_templates.Add(SPSiteTemplates.SPSPortal , SP_SITE_TEMPLATE_SPS_PORTAL);
				_templates.Add(SPSiteTemplates.TeamSite , SP_SITE_TEMPLATE_TEAM_SITE);
				_templates.Add(SPSiteTemplates.Wiki , SP_SITE_TEMPLATE_WIKI);
			}
			return _templates;
		}
	}

	public static string GetSharePointStringKey(this SPSiteTemplates siteTemplate)
	{
		return Templates.GetByFirst(siteTemplate);
	}
}
```

Sí, eso de ahí es un singleton y podría tener problemas potenciales de concurrencia, pero no estamos esperando agregar/remover/editar items. Además, yo habría ido con un constructor estático, pero los métodos de extensión tienen que implementarse en clases estáticas, y las clases marcadas como estáticas no tienen permitido tener constructores estáticos.

## Toques extras

Con esto ya casi había terminado, pero resulta que si queremos verificar que un sitio existe, necesitamos usar su URL completa, pero si usamos el símbolo de los dos puntos ( : ) entonces vamos a tener una linda SPException diciéndonos que la URL es inválida. Lo que tenemos que hacer es usar URLs relativas a la URL del site collection, así que incluí un par de líneas para parsearlas.

Así que, aquí está la última versión del método CreateSite:

```csharp
public SPWeb CreateSite(string parentSiteURL, string siteURLRequested, string siteTitle, SPSiteTemplates siteTemplate, SPLocales locale, string description)
{
	SPWeb resultWeb = null;

	PerformActionOnSite(parentSiteURL, (siteCollection, parentWeb) =>
	{
		SPWebTemplateCollection Templates = siteCollection.GetWebTemplates(Convert.ToUInt32(locale));
		SPWebTemplate spTemplate = Templates[siteTemplate.GetSharePointStringKey()];

		var rootUrl = siteCollection.Url;
		if (siteURLRequested.ToUpper().StartsWith(rootUrl.ToUpper()))
		{
			siteURLRequested = siteURLRequested.Remove(0, rootUrl.Length);
			if (siteURLRequested.StartsWith("/"))
				siteURLRequested = siteURLRequested.Remove(0, 1);

			if (siteURLRequested.Length == 0) //they were equal, don't create the root site
			{
				resultWeb = parentWeb;
			}
			else if (parentWeb.Webs[siteURLRequested].Exists) //it's not the root site, but it exist anyway
			{
				resultWeb = parentWeb.Webs[siteURLRequested];
			}
			else
			{
				resultWeb = parentWeb.Webs.Add(siteURLRequested, siteTitle, description, Convert.ToUInt32(locale), spTemplate, false, false);
			}
		}
	});

	return resultWeb;
}
```

Si se sienten confundidos por el método **PerformActionOnSite**, es un wrapper que creé para automáticamente usar y hacer dispose en los objetos **SPSite **y **SPWeb **.

```csharp
protected void PerformActionOnSite(string siteUrl, Action<SPSite, SPWeb> action)
{
	using (SPSite site = new SPSite(siteUrl))
	{
		using (SPWeb web = site.OpenWeb())
		{
			action(site, web);
			web.Close();
		}
		site.Close();
	}
}
```

Ok, entonces ya todo está en su lugar, deberían poder usarlo así::

```csharp
CreateSite("http://siteCollectionUrl", "http://siteCollectionUrl/newSite", SPSiteTemplates.PublishingSite, SPLocales.English_UnitedStates, "site description");
```

Eso es todo. Espero que esto sea útil para ustedes. Subí una copia de todo este código en [http://files.alphasmanifesto.com/Software/](http://files.alphasmanifesto.com/Software/)

¡Disfruten!

## Referencias:

- [Programatically create a Sharepoint site based on a site definition](http://blah.winsmarts.com/2007-5-Programatically_create_a_SharePoint_site_based_on_a_site_definition.aspx), WinSmarts.com
- [SharePoint Locale ID (LCID) Table](http://grounding.co.za/blogs/brett/archive/2008/04/09/sharepoint-locale-id-lcid-table.aspx), Tech Talk with Brett Maytom
- [Create a site programmatically in moss](http://www.sharepointkings.com/2009/02/create-site-programmatically-in-moss.html), SharePoint Kings, artículo de Malay Vasavada
- [Bidirectional 1 to 1 Dictionary in C#](http://stackoverflow.com/questions/268321/bidirectional-1-to-1-dictionary-in-c), pregunta (y respuesta) by [Joel in G&ouml;](http://stackoverflow.com/users/6091/joel-in-go)
- [CreateSPSite.cs](http://files.alphasmanifesto.com/Software/CreateSPSite.cs), el código completo para este artículo
