

Import-Module -Name Terminal-Icons

oh-my-posh --init --shell pwsh --config D:\WindowsTerminal\ohmyposh.json | Invoke-Expression

#you have to put this in $profile or $profile.currentuserallhosts
$esc = [char]27

if($env:WT_SESSION){
	$prevprompt = $Function:prompt
	function prompt {
		if ($pwd.provider.name -eq "FileSystem") {
			$p = $pwd.ProviderPath
			Write-host "$esc]9;9;`"$p`"$esc\" -NoNewline
		}
		return $prevprompt.invoke()
	}
}