---
layout: post
status: publish
published: true
title: Crear sitios de SharePoint program&aacute;ticamente
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 2972
wordpress_url: http://blog.alphasmanifesto.com/?p=2972
date: '2011-05-11 03:19:26 +0000'
date_gmt: '2011-05-11 05:19:26 +0000'
categories:
- Projects
- Technology
tags:
- automatizaci&oacute;n
- C#
- desarrollo
- SharePoint
- m&eacute;todos de extensi&oacute;n
- singleton
comments: []
---
<h2 style="text-align: justify;">El objetivo</h2>
<p style="text-align: justify;">Estuve peleando estos d&iacute;as con la posibilidad de crear sitios de SharePoint program&aacute;ticamente desde mi c&oacute;digo. Sin embargo, a&uacute;n cuando esto fue hecho para un proyecto interno, tom&eacute; tanto de la internet que realmente siento que debo devolver algo a la comunidad. Adem&aacute;s, no voy a divulgar nada relacionado al proyecto, as&iacute; que aqu&iacute; vamos.</p>
<p style="text-align: justify;">Primero, buscando en internet una forma de crear estos sitios program&aacute;ticamente, me top&eacute; con un art&iacute;culo del 2007 de WinSmarts.com, llamado <a href="http://blah.winsmarts.com/2007-5-Programatically_create_a_SharePoint_site_based_on_a_site_definition.aspx">Programatically create a Sharepoint site based on a site definition</a>. Aqu&iacute; est&aacute; el c&oacute;digo de ese post:</p>
<p>[sourcecode language="csharp"]<br />
public static bool CreateSite(string parentSiteURL, string siteURLRequested,<br />
    string siteTitle, string siteTemplateName)<br />
{<br />
    bool returnCondition = false; // Assume failure.<br />
    const Int32 LOCALE_ID_ENGLISH = 1033;<br />
    using (SPSite siteCollection = new SPSite(parentSiteURL))<br />
    {<br />
        SPWeb parentWeb = siteCollection.OpenWeb();<br />
        SPWebTemplateCollection Templates = siteCollection.GetWebTemplates(Convert.ToUInt32(LOCALE_ID_ENGLISH));<br />
        SPWebTemplate siteTemplate = Templates[siteTemplateName];<br />
        if (parentWeb.Webs[siteURLRequested].Exists)<br />
        {<br />
            parentWeb.Webs.Delete(siteURLRequested);<br />
        }<br />
        parentWeb.Webs.Add(siteURLRequested, siteTitle, "", Convert.ToUInt32(LOCALE_ID_ENGLISH), siteTemplate, false, false);</p>
<p>        // All is good?<br />
        returnCondition = true;<br />
    }<br />
    return returnCondition;<br />
}<br />
[/sourcecode]</p>
<p style="text-align: justify;">Lo que yo quer&iacute;a cambiar de esta soluci&oacute;n era:</p>
<ul style="text-align: justify;">
<li>Los Locales estaban hardcodeados</li>
<li>Los Site templates estaban hardcodeados</li>
<li>La descripci&oacute;n del sitio estaba hardcodeado (esa es la cadena vac&iacute;a en la llamada a webs.add)</li>
</ul>
<h2 style="text-align: justify;">Removiendo literales...</h2>
<p style="text-align: justify;">Entonces fui a revisar la lista de locales: <a href="http://grounding.co.za/blogs/brett/archive/2008/04/09/sharepoint-locale-id-lcid-table.aspx">SharePoint Locale ID (LCID) Table</a>, y una lista de los identificadores de site templates, en un art&iacute;culo llamado <a href="http://www.sharepointkings.com/2009/02/create-site-programmatically-in-moss.html">Create a site programmatically in moss</a>.</p>
<p style="text-align: justify;">Bueno... aqu&iacute; vamos (cuidado, vienen enumeraciones largas):</p>
<p>[sourcecode language="csharp"]<br />
public enum SPLocales: uint<br />
{<br />
	Afrikaans /*af*/ = 1078,<br />
	Albanian /*sq*/ = 1052,<br />
	Arabic_UnitedArabEmirates /*ar-ae*/ = 14337,<br />
	Arabic_Bahrain /*ar-bh*/ = 15361,<br />
	Arabic_Algeria /*ar-dz*/ = 5121,<br />
	Arabic_Egypt /*ar-eg*/ = 3073,<br />
	Arabic_Iraq /*ar-iq*/ = 2049,<br />
	Arabic_Jordan /*ar-jo*/ = 11265,<br />
	Arabic_Kuwait /*ar-kw*/ = 13313,<br />
	Arabic_Lebanon /*ar-lb*/ = 12289,<br />
	Arabic_Libya /*ar-ly*/ = 4097,<br />
	Arabic_Morocco /*ar-ma*/ = 6145,<br />
	Arabic_Oman /*ar-om*/ = 8193,<br />
	Arabic_Qatar /*ar-qa*/ = 16385,<br />
	Arabic_SaudiArabia /*ar-sa*/ = 1025,<br />
	Arabic_Syria /*ar-sy*/ = 10241,<br />
	Arabic_Tunisia /*ar-tn*/ = 7169,<br />
	Arabic_Yemen /*ar-ye*/ = 9217,<br />
	Armenian /*hy*/ = 1067,<br />
	Azeri_Latin /*az-az*/ = 1068,<br />
	Azeri_Cyrillic /*az-az*/ = 2092,<br />
	Basque /*eu*/ = 1069,<br />
	Belarusian /*be*/ = 1059,<br />
	Bulgarian /*bg*/ = 1026,<br />
	Catalan /*ca*/ = 1027,<br />
	Chinese_China /*zh-cn*/ = 2052,<br />
	Chinese_HongKongSAR /*zh-hk*/ = 3076,<br />
	Chinese_MacauSAR /*zh-mo*/ = 5124,<br />
	Chinese_Singapore /*zh-sg*/ = 4100,<br />
	Chinese_Taiwan /*zh-tw*/ = 1028,<br />
	Croatian /*hr*/ = 1050,<br />
	Czech /*cs*/ = 1029,<br />
	Danish /*da*/ = 1030,<br />
	Dutch_TheNetherlands /*nl-nl*/ = 1043,<br />
	Dutch_Belgium /*nl-be*/ = 2067,<br />
	English_Australia /*en-au*/ = 3081,<br />
	English_Belize /*en-bz*/ = 10249,<br />
	English_Canada /*en-ca*/ = 4105,<br />
	English_Caribbean /*en-cb*/ = 9225,<br />
	English_Ireland /*en-ie*/ = 6153,<br />
	English_Jamaica /*en-jm*/ = 8201,<br />
	English_NewZealand /*en-nz*/ = 5129,<br />
	English_Phillippines /*en-ph*/ = 13321,<br />
	English_SouthAfrica /*en-za*/ = 7177,<br />
	English_Trinidad /*en-tt*/ = 11273,<br />
	English_UnitedKingdom /*en-gb*/ = 2057,<br />
	English_UnitedStates /*en-us*/ = 1033,<br />
	Estonian /*et*/ = 1061,<br />
	Farsi /*fa*/ = 1065,<br />
	Finnish /*fi*/ = 1035,<br />
	Faroese /*fo*/ = 1080,<br />
	French_France /*fr-fr*/ = 1036,<br />
	French_Belgium /*fr-be*/ = 2060,<br />
	French_Canada /*fr-ca*/ = 3084,<br />
	French_Luxembourg /*fr-lu*/ = 5132,<br />
	French_Switzerland /*fr-ch*/ = 4108,<br />
	Gaelic_Ireland /*gd-ie*/ = 2108,<br />
	Gaelic_Scotland /*gd*/ = 1084,<br />
	German_Germany /*de-de*/ = 1031,<br />
	German_Austria /*de-at*/ = 3079,<br />
	German_Liechtenstein /*de-li*/ = 5127,<br />
	German_Luxembourg /*de-lu*/ = 4103,<br />
	German_Switzerland /*de-ch*/ = 2055,<br />
	Greek /*el*/ = 1032,<br />
	Hebrew /*he*/ = 1037,<br />
	Hindi /*hi*/ = 1081,<br />
	Hungarian /*hu*/ = 1038,<br />
	Icelandic /*is*/ = 1039,<br />
	Indonesian /*id*/ = 1057,<br />
	Italian_Italy /*it-it*/ = 1040,<br />
	Italian_Switzerland /*it-ch*/ = 2064,<br />
	Japanese /*ja*/ = 1041,<br />
	Korean /*ko*/ = 1042,<br />
	Latvian /*lv*/ = 1062,<br />
	Lithuanian /*lt*/ = 1063,<br />
	FYRO_Macedonian /*mk*/ = 1071,<br />
	Malay_Malaysia /*ms-my*/ = 1086,<br />
	Malay_Brunei /*ms-bn*/ = 2110,<br />
	Maltese /*mt*/ = 1082,<br />
	Marathi /*mr*/ = 1102,<br />
	Norwegian_Bokmal /*no-no*/ = 1044,<br />
	Norwegian_Nynorsk /*no-no*/ = 2068,<br />
	Polish /*pl*/ = 1045,<br />
	Portuguese_Portugal /*pt-pt*/ = 2070,<br />
	Portuguese_Brazil /*pt-br*/ = 1046,<br />
	Raeto_Romance /*rm*/ = 1047,<br />
	Romanian_Romania /*ro*/ = 1048,<br />
	Romanian_RepublicOfMoldova /*ro-mo*/ = 2072,<br />
	Russian /*ru*/ = 1049,<br />
	Russian_RepublicOfMoldova /*ru-mo*/ = 2073,<br />
	Sanskrit /*sa*/ = 1103,<br />
	Serbian_Cyrillic /*sr-sp*/ = 3098,<br />
	Serbian_Latin /*sr-sp*/ = 2074,<br />
	Setsuana /*tn*/ = 1074,<br />
	Slovenian /*sl*/ = 1060,<br />
	Slovak /*sk*/ = 1051,<br />
	Sorbian /*sb*/ = 1070,<br />
	Spanish_Spain /*es-es*/ = 1034,<br />
	Spanish_Argentina /*es-ar*/ = 11274,<br />
	Spanish_Bolivia /*es-bo*/ = 16394,<br />
	Spanish_Chile /*es-cl*/ = 13322,<br />
	Spanish_Colombia /*es-co*/ = 9226,<br />
	Spanish_CostaRica /*es-cr*/ = 5130,<br />
	Spanish_DominicanRepublic /*es-do*/ = 7178,<br />
	Spanish_Ecuador /*es-ec*/ = 12298,<br />
	Spanish_Guatemala /*es-gt*/ = 4106,<br />
	Spanish_Honduras /*es-hn*/ = 18442,<br />
	Spanish_Mexico /*es-mx*/ = 2058,<br />
	Spanish_Nicaragua /*es-ni*/ = 19466,<br />
	Spanish_Panama /*es-pa*/ = 6154,<br />
	Spanish_Peru /*es-pe*/ = 10250,<br />
	Spanish_PuertoRico /*es-pr*/ = 20490,<br />
	Spanish_Paraguay /*es-py*/ = 15370,<br />
	Spanish_ElSalvador /*es-sv*/ = 17418,<br />
	Spanish_Uruguay /*es-uy*/ = 14346,<br />
	Spanish_Venezuela /*es-ve*/ = 8202,<br />
	Sutu /*sx*/ = 1072,<br />
	Swahili /*sw*/ = 1089,<br />
	Swedish_Sweden /*sv-se*/ = 1053,<br />
	Swedish_Finland /*sv-fi*/ = 2077,<br />
	Tamil /*ta*/ = 1097,<br />
	Tatar /*tt*/ = 1092,<br />
	Thai /*th*/ = 1054,<br />
	Turkish /*tr*/ = 1055,<br />
	Tsonga /*ts*/ = 1073,<br />
	Ukrainian /*uk*/ = 1058,<br />
	Urdu /*ur*/ = 1056,<br />
	Uzbek_Cyrillic /*uz-uz*/ = 2115,<br />
	Uzbek_Latin /*uz-uz*/ = 1091,<br />
	Vietnamese /*vi*/ = 1066,<br />
	Xhosa /*xh*/ = 1076,<br />
	Yiddish /*yi*/ = 1085,<br />
	Zulu /*zu*/ = 1077<br />
}</p>
<p>public enum SPSiteTemplates<br />
{<br />
	TeamSite,<br />
	BlankSite,<br />
	DocumentWorkspace,<br />
	BasicMeetingWorkspace,<br />
	BlankMeetingWorkspace,<br />
	DecisionMeetingWorkspace,<br />
	SocialMeetingWorkspace,<br />
	MultiPageMeetingWorkspace,<br />
	Wiki,<br />
	Blog,<br />
	///<br />
<summary>
	/// A central document management location for an enterprise<br />
	/// </summary>
<p>	DocumentCenter,<br />
	///<br />
<summary>
	/// A central location in which records managers can define routes for incoming files<br />
	/// </summary>
<p>	RecordsCenter1,<br />
	RecordsCenter2,<br />
	PublishingSite,<br />
	///<br />
<summary>
	/// A site for publishing web pages on a schedule with workflow features enabled<br />
	/// </summary>
<p>	PublishingSite2,<br />
	PressReleasesSite,<br />
	///<br />
<summary>
	/// A publishing site for web pages using approval workflows<br />
	/// </summary>
<p>	PublishingSiteWithWorkflow,<br />
	///<br />
<summary>
	/// A site for publishing news and articles<br />
	/// </summary>
<p>	NewsSite,<br />
	///<br />
<summary>
	/// A site for creating, managing, and delivering web pages, dashboards, and Key Performance Indicators (KPIs)<br />
	/// </summary>
<p>	ReportCenter,<br />
	///<br />
<summary>
	/// A starter hierarchy for an intranet divisional portal<br />
	/// </summary>
<p>	SPSPortal,<br />
	///<br />
<summary>
	/// A profile site that includes page layouts with zones<br />
	/// </summary>
<p>	ProfileSite,<br />
	///<br />
<summary>
	/// A site collection preconfigured for revision-controlled, secure content creation and publication<br />
	/// </summary>
<p>	PublishingPortal,<br />
	///<br />
<summary>
	/// Keep in mind that only one of these can be provisioned per Shared Services Provider<br />
	/// </summary>
<p>	MySiteHost,<br />
	///<br />
<summary>
	/// A site designed to deliver the search query and results experience<br />
	/// </summary>
<p>	SearchCenter,<br />
	///<br />
<summary>
	/// A superset of the previous; does not appear in navigation bars<br />
	/// </summary>
<p>	SearchCenter2<br />
}<br />
[/sourcecode]</p>
<h3 style="text-align: justify;">Un poco de magia enum</h3>
<p style="text-align: justify;">Lo que nos queda es:</p>
<ul style="text-align: justify;">
<li>Convertir enums <strong>SPLocales </strong> a su representaci&oacute;n correspondiente en uint</li>
<li>Convertir enums <strong>SPSiteTemplates </strong> a su representaci&oacute;n en cadena correspondientes</li>
<li>Evitar intentar crear sitios duplicados</li>
</ul>
<p style="text-align: justify;">Para convertir enums <strong>SPLocales</strong> a su representaci&oacute;n uint, s&oacute;lo tenemos que hacer el casting correspondiente. Esta es la raz&oacute;n por la que hicimos al enum heredar de unit y setear el valor apropiado en cada elemento.</p>
<p style="text-align: justify;">Para poder convertir enums <strong>SPSiteTemplates</strong> a cadenas, el m&eacute;todo com&uacute;n es utilizar atributos y reflexi&oacute;n, pero personalmente no me gusta esa forma, as&iacute; que hice una con diccionarios y m&eacute;todos de extensi&oacute;n. La idea es proveer al enum la posibilidad de convertirse en una cadena, y estas cadenas de ser parseadas en el enum nuevamente. Para tener este tipo de relaci&oacute;n en ambos sentidos, us&eacute; la implementaci&oacute;n de <strong>BiDictionaryOneToOne </strong> del usuario de StackOverflow's <a href="http://stackoverflow.com/users/6091/joel-in-go">Joel in Go</a>, en una pregunta de sobre c&oacute;mo hacer un diccionario buscable key-value y buscable value-key: <a href="http://stackoverflow.com/questions/268321/bidirectional-1-to-1-dictionary-in-c">Bidirectional 1 to 1 Dictionary in C#</a>.</p>
<p>[sourcecode language="csharp"]<br />
public static class SPSiteTemplateMethodExtension<br />
{<br />
	private const string SP_SITE_TEMPLATE_TEAM_SITE = "STS#0";<br />
	private const string SP_SITE_TEMPLATE_BLANK_SITE = "STS#1";<br />
	private const string SP_SITE_TEMPLATE_DOCUMENT_WORKSPACE = "STS#2";<br />
	private const string SP_SITE_TEMPLATE_BASIC_MEETING_WORKSPACE = "MPS#0";<br />
	private const string SP_SITE_TEMPLATE_BLANK_MEETING_WORKSPACE = "MPS#1";<br />
	private const string SP_SITE_TEMPLATE_DECISION_MEETING_WORKSPACE = "MPS#2";<br />
	private const string SP_SITE_TEMPLATE_SOCIAL_MEETING_WORKSPACE = "MPS#3";<br />
	private const string SP_SITE_TEMPLATE_MULTI_PAGE_MEETING_WORKSPACE = "MPS#4";<br />
	private const string SP_SITE_TEMPLATE_WIKI = "WIKI#0";<br />
	private const string SP_SITE_TEMPLATE_BLOG = "BLOG#0";<br />
	private const string SP_SITE_TEMPLATE_DOCUMENT_CENTER = "BDR#0";<br />
	private const string SP_SITE_TEMPLATE_RECORDS_CENTER_1 = "OFFILE#0";<br />
	private const string SP_SITE_TEMPLATE_RECORDS_CENTER_2 = "OFFILE#1";<br />
	private const string SP_SITE_TEMPLATE_PUBLISHING_SITE = "CMSPUBLISHING#0";<br />
	private const string SP_SITE_TEMPLATE_PUBLISHING_SITE_2 = "BLANKINTERNET#0";<br />
	private const string SP_SITE_TEMPLATE_PRESS_RELEASES_SITE = "BLANKINTERNET#1";<br />
	private const string SP_SITE_TEMPLATE_PUBLISHING_SITE_WITH_WORKFLOW = "BLANKINTERNET#2";<br />
	private const string SP_SITE_TEMPLATE_NEWS_SITE = "SPSNHOME#0";<br />
	private const string SP_SITE_TEMPLATE_REPORT_CENTER = "SPSREPORTCENTER#0";<br />
	private const string SP_SITE_TEMPLATE_SPS_PORTAL = "SPSPORTAL#0";<br />
	private const string SP_SITE_TEMPLATE_PROFILE_SITE = "PROFILES#0";<br />
	private const string SP_SITE_TEMPLATE_PUBLISHING_PORTAL = "BLANKINTERNETCONTAINER#0";<br />
	private const string SP_SITE_TEMPLATE_MY_SITE_HOST = "SPSMYSITEHOST#0";<br />
	private const string SP_SITE_TEMPLATE_SEARCH_CENTER = "SRCHCENTERLITE#0";<br />
	private const string SP_SITE_TEMPLATE_SEARCH_CENTER_2 = "SRCHCENTERLITE#1";</p>
<p>	private static BiDictionaryOneToOne<SPSiteTemplates, string> _templates;<br />
	private static BiDictionaryOneToOne<SPSiteTemplates, string> Templates {<br />
		get {<br />
			if (_templates == null) {<br />
				_templates = new BiDictionaryOneToOne<SPSiteTemplates, string>();<br />
				_templates.Add(SPSiteTemplates.BasicMeetingWorkspace, SP_SITE_TEMPLATE_BASIC_MEETING_WORKSPACE);<br />
				_templates.Add(SPSiteTemplates.BlankMeetingWorkspace, SP_SITE_TEMPLATE_BLANK_MEETING_WORKSPACE);<br />
				_templates.Add(SPSiteTemplates.BlankSite , SP_SITE_TEMPLATE_BLANK_SITE);<br />
				_templates.Add(SPSiteTemplates.Blog , SP_SITE_TEMPLATE_BLOG);<br />
				_templates.Add(SPSiteTemplates.DecisionMeetingWorkspace , SP_SITE_TEMPLATE_DECISION_MEETING_WORKSPACE);<br />
				_templates.Add(SPSiteTemplates.DocumentCenter , SP_SITE_TEMPLATE_DOCUMENT_CENTER);<br />
				_templates.Add(SPSiteTemplates.DocumentWorkspace , SP_SITE_TEMPLATE_DOCUMENT_WORKSPACE);<br />
				_templates.Add(SPSiteTemplates.MultiPageMeetingWorkspace , SP_SITE_TEMPLATE_MULTI_PAGE_MEETING_WORKSPACE);<br />
				_templates.Add(SPSiteTemplates.MySiteHost , SP_SITE_TEMPLATE_MY_SITE_HOST);<br />
				_templates.Add(SPSiteTemplates.NewsSite , SP_SITE_TEMPLATE_NEWS_SITE);<br />
				_templates.Add(SPSiteTemplates.PressReleasesSite , SP_SITE_TEMPLATE_PRESS_RELEASES_SITE);<br />
				_templates.Add(SPSiteTemplates.ProfileSite , SP_SITE_TEMPLATE_PROFILE_SITE);<br />
				_templates.Add(SPSiteTemplates.PublishingPortal , SP_SITE_TEMPLATE_PUBLISHING_PORTAL);<br />
				_templates.Add(SPSiteTemplates.PublishingSite , SP_SITE_TEMPLATE_PUBLISHING_SITE);<br />
				_templates.Add(SPSiteTemplates.PublishingSite2 , SP_SITE_TEMPLATE_PUBLISHING_SITE_2);<br />
				_templates.Add(SPSiteTemplates.PublishingSiteWithWorkflow , SP_SITE_TEMPLATE_PUBLISHING_SITE_WITH_WORKFLOW);<br />
				_templates.Add(SPSiteTemplates.RecordsCenter1 , SP_SITE_TEMPLATE_RECORDS_CENTER_1);<br />
				_templates.Add(SPSiteTemplates.RecordsCenter2 , SP_SITE_TEMPLATE_RECORDS_CENTER_2);<br />
				_templates.Add(SPSiteTemplates.ReportCenter , SP_SITE_TEMPLATE_REPORT_CENTER);<br />
				_templates.Add(SPSiteTemplates.SearchCenter , SP_SITE_TEMPLATE_SEARCH_CENTER);<br />
				_templates.Add(SPSiteTemplates.SearchCenter2 , SP_SITE_TEMPLATE_SEARCH_CENTER_2);<br />
				_templates.Add(SPSiteTemplates.SocialMeetingWorkspace , SP_SITE_TEMPLATE_SOCIAL_MEETING_WORKSPACE);<br />
				_templates.Add(SPSiteTemplates.SPSPortal , SP_SITE_TEMPLATE_SPS_PORTAL);<br />
				_templates.Add(SPSiteTemplates.TeamSite , SP_SITE_TEMPLATE_TEAM_SITE);<br />
				_templates.Add(SPSiteTemplates.Wiki , SP_SITE_TEMPLATE_WIKI);<br />
			}<br />
			return _templates;<br />
		}<br />
	}</p>
<p>	public static string GetSharePointStringKey(this SPSiteTemplates siteTemplate)<br />
	{<br />
		return Templates.GetByFirst(siteTemplate);<br />
	}<br />
}<br />
[/sourcecode]</p>
<p style="text-align: justify;">S&iacute;, eso de ah&iacute; es un singleton y podr&iacute;a tener problemas potenciales de concurrencia, pero no estamos esperando agregar/remover/editar items. Adem&aacute;s, yo habr&iacute;a ido con un constructor est&aacute;tico, pero los m&eacute;todos de extensi&oacute;n tienen que implementarse en clases est&aacute;ticas, y las clases marcadas como est&aacute;ticas no tienen permitido tener constructores est&aacute;ticos.</p>
<h2 style="text-align: justify;">Toques extras</h2>
<p style="text-align: justify;">Con esto ya casi hab&iacute;a terminado, pero resulta que si queremos verificar que un sitio existe, necesitamos usar su URL completa, pero si usamos el s&iacute;mbolo de los dos puntos ( : ) entonces vamos a tener una linda SPException dici&eacute;ndonos que la URL es inv&aacute;lida. Lo que tenemos que hacer es usar URLs relativas a la URL del site collection, as&iacute; que inclu&iacute; un par de l&iacute;neas para parsearlas.</p>
<p style="text-align: justify;">As&iacute; que, aqu&iacute; est&aacute; la &uacute;ltima versi&oacute;n del m&eacute;todo CreateSite:</p>
<p>[sourcecode language="csharp"]<br />
public SPWeb CreateSite(string parentSiteURL, string siteURLRequested, string siteTitle, SPSiteTemplates siteTemplate, SPLocales locale, string description)<br />
{<br />
	SPWeb resultWeb = null;</p>
<p>	PerformActionOnSite(parentSiteURL, (siteCollection, parentWeb) =><br />
	{<br />
		SPWebTemplateCollection Templates = siteCollection.GetWebTemplates(Convert.ToUInt32(locale));<br />
		SPWebTemplate spTemplate = Templates[siteTemplate.GetSharePointStringKey()];</p>
<p>		var rootUrl = siteCollection.Url;<br />
		if (siteURLRequested.ToUpper().StartsWith(rootUrl.ToUpper()))<br />
		{<br />
			siteURLRequested = siteURLRequested.Remove(0, rootUrl.Length);<br />
			if (siteURLRequested.StartsWith("/"))<br />
				siteURLRequested = siteURLRequested.Remove(0, 1);</p>
<p>			if (siteURLRequested.Length == 0) //they were equal, don't create the root site<br />
			{<br />
				resultWeb = parentWeb;<br />
			}<br />
			else if (parentWeb.Webs[siteURLRequested].Exists) //it's not the root site, but it exist anyway<br />
			{<br />
				resultWeb = parentWeb.Webs[siteURLRequested];<br />
			}<br />
			else<br />
			{<br />
				resultWeb = parentWeb.Webs.Add(siteURLRequested, siteTitle, description, Convert.ToUInt32(locale), spTemplate, false, false);<br />
			}<br />
		}<br />
	});</p>
<p>	return resultWeb;<br />
}<br />
[/sourcecode]</p>
<p style="text-align: justify;">Si se sienten confundidos por el m&eacute;todo <strong>PerformActionOnSite</strong>, es un wrapper que cre&eacute; para autom&aacute;ticamente usar y hacer dispose en los objetos <strong>SPSite </strong>y <strong>SPWeb </strong>.</p>
<p>[sourcecode language="csharp"]<br />
protected void PerformActionOnSite(string siteUrl, Action<SPSite, SPWeb> action)<br />
{<br />
	using (SPSite site = new SPSite(siteUrl))<br />
	{<br />
		using (SPWeb web = site.OpenWeb())<br />
		{<br />
			action(site, web);<br />
			web.Close();<br />
		}<br />
		site.Close();<br />
	}<br />
}<br />
[/sourcecode]</p>
<p style="text-align: justify;">Ok, entonces ya todo est&aacute; en su lugar, deber&iacute;an poder usarlo as&iacute;::</p>
<p>[sourcecode language="csharp"]<br />
CreateSite("http://siteCollectionUrl", "http://siteCollectionUrl/newSite", SPSiteTemplates.PublishingSite, SPLocales.English_UnitedStates, "site description");<br />
[/sourcecode]</p>
<p style="text-align: justify;">Eso es todo. Espero que esto sea &uacute;til para ustedes. Sub&iacute; una copia de todo este c&oacute;digo en&nbsp;<a href="http://files.alphasmanifesto.com/Software/">http://files.alphasmanifesto.com/Software/</a></p>
<p style="text-align: justify;">&iexcl;Disfruten!</p>
<h2 style="text-align: justify;">Referencias:</h2>
<ul>
<li><a href="http://blah.winsmarts.com/2007-5-Programatically_create_a_SharePoint_site_based_on_a_site_definition.aspx">Programatically create a Sharepoint site based on a site definition</a>, WinSmarts.com</li>
<li><a href="http://grounding.co.za/blogs/brett/archive/2008/04/09/sharepoint-locale-id-lcid-table.aspx">SharePoint Locale ID (LCID) Table</a>, Tech Talk with Brett Maytom</li>
<li><a href="http://www.sharepointkings.com/2009/02/create-site-programmatically-in-moss.html">Create a site programmatically in moss</a>, SharePoint Kings, art&iacute;culo de Malay Vasavada</li>
<li><a href="http://stackoverflow.com/questions/268321/bidirectional-1-to-1-dictionary-in-c">Bidirectional 1 to 1 Dictionary in C#</a>, pregunta (y respuesta) by <a href="http://stackoverflow.com/users/6091/joel-in-go">Joel in G&ouml;</a></li>
<li><a href="http://files.alphasmanifesto.com/Software/CreateSPSite.cs">CreateSPSite.cs</a>, el c&oacute;digo completo para este art&iacute;culo</li>
</ul>
