<cfoutput>
<cftry>

<div class="description">
	<p>The BigRig applicaton installer will parse the config/plugins/bigrig/rigs.cfm file for calls to <cfoutput>#bigrigHelperFunction#</cfoutput>() and let you control them through a web interface(only available in design and maintenance modes). You can control what folders are wheels enabled by code, or by using this form.</p>
	<p>This form simply automates the bits of coding required to add more wheels enabled folders to an application.</p>
</div>
<cfif flashKeyExists("bigrigInstall")>
	<strong>Installer requires the rigs.cfm file to work.</strong>
<cfelse>
#startFormTag(action="save", class="properties")#
<cfset bigRigSettings = $getAppDefinitions().bigRigSettings />
<cfset newIndex = arrayLen(bigRigSettings)+1 />
<div class="item template">
	#textfieldTag(name="bigRigSettings[#newIndex#][name]", value="", label="Name: ", disabled="true")#
	#textfieldTag(name="bigRigSettings[#newIndex#][keyword]", value="", label="Keyword: ", disabled="true")#
	#textfieldTag(name="bigRigSettings[#newIndex#][singleAppFolder]", value="", label="Single App Folder: ", disabled="true")#
</div>

<cfset i = 1 />

<cfloop array="#bigRigSettings#" index="appRoute">
	<div class="item #cycle("odd,even")#">
		#textfieldTag(name="bigRigSettings[#i#][name]", value=appRoute.name, label="Rig Name: ")#
		<cfif NOT structKeyExists(appRoute, "keyword")>
			<cfset appRoute.keyword = "">
		</cfif>
		#textfieldTag(name="bigRigSettings[#i#][keyword]", value=appRoute.keyword, label="Keyword: ")#
		<cfif NOT structKeyExists(appRoute, "singleAppFolder")>
			<cfset appRoute.singleAppFolder = "">
		</cfif>
		#textfieldTag(name="bigRigSettings[#i#][singleAppFolder]", value=appRoute.singleAppFolder, label="Single App Folder: ")#
	</div>
	<cfset i++ />
</cfloop>
<a href="##add" class="add">Add new Application Folder</a>
#submitTag()#
#endFormTag()#
</cfif>

<cfcatch>
<cfdump label="config.cfm" var="#cfcatch#">
</cfcatch>
</cftry>
</cfoutput>