<h2><cfoutput><a name="#bigRigHelperFunction#"></a>#bigrigHelperFunction#</cfoutput>()</h2>
<h3>Description</h3>
<p>Adds wheels enabled folders to your application.</p>
<h3>Function Syntax</h3>
<p><cfoutput>#bigrigHelperFunction#</cfoutput>(<em>name</em>[, <em>keyword</em>, <em>singleAppFolder</em>])</p>
<table>
	<thead>
		<tr>
			<th>Parameter</th>
			<th>Type</th>
			<th>Required</th>
			<th>Default</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody>
		
			<tr class="<cfoutput>#cycle("odd,even")#</cfoutput>">
				<td valign="top"><code>name</code></td>
				<td valign="top"><code>string</code></td>
				<td valign="top" class="required">Yes</td>
				<td valign="top"><code></code></td>
				<td valign="top"> The name of the application folder you want to add wheels support to.</td>
			</tr>
		
			<tr class="<cfoutput>#cycle("odd,even")#</cfoutput>">
				<td valign="top"><code>keyword</code></td>
				<td valign="top"><code>string</code></td>
				<td valign="top" class="required">No</td>
				<td valign="top"><code>#name#</code></td>
				<td valign="top"> Used as a trigger in constructing routes for the current application folder. Defaults to <code>arguments.name</code</td>
			</tr>
		
			<tr class="<cfoutput>#cycle("odd,even")#</cfoutput>">
				<td valign="top"><code>singleAppFolder</code></td>
				<td valign="top"><code>string</code></td>
				<td valign="top" class="required">No</td>
				<td valign="top"></td>
				<td valign="top">If you want to enable a specific folder, pass the folder name in for this parameter.</td>
			</tr>
		
	</tbody>
</table>
