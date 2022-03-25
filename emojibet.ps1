
PowerShell.exe -windowstyle hidden{
#Load the initial GUI popup prompting the user to enter the alphanumeric text.
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = 'Emojibet'
$msg   = 'Enter your text below:'

$name = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)

#If text not entered, exit the script

If ($name -eq '') {
    exit
    }

#The scan of the original string, and subsequently conversion 'from' -> 'To' translations.

-join $(
  $emojibet = switch($name.ToCharArray()){
    a {':regional_indicator_a:'}
    b {':regional_indicator_b:'}
    c {':regional_indicator_c:'}
    d {':regional_indicator_d:'}
    e {':regional_indicator_e:'}
    f {':regional_indicator_f:'}
    g {':regional_indicator_g:'}
    h {':regional_indicator_h:'}
    i {':regional_indicator_i:'}
    j {':regional_indicator_j:'}
    k {':regional_indicator_k:'}
    l {':regional_indicator_l:'}
    m {':regional_indicator_m:'}
    n {':regional_indicator_n:'}
    o {':regional_indicator_o:'}
    p {':regional_indicator_p:'}
    q {':regional_indicator_q:'}
    r {':regional_indicator_r:'}
    s {':regional_indicator_s:'}
    t {':regional_indicator_t:'}
    u {':regional_indicator_u:'}
    v {':regional_indicator_v:'}
    w {':regional_indicator_w:'}
    x {':regional_indicator_x:'}
    y {':regional_indicator_y:'}
    z {':regional_indicator_z:'}
    ' ' {':small_orange_diamond:'}
    1 {':one:'}
    2 {':two:'}
    3 {':three:'}
    4 {':four:'}
    5 {':five:'}
    6 {':six:'}
    7 {':seven:'}
    8 {':eight:'}
    9 {':nine:'}
    0 {':zero:'}
    default {$_}
  }
)


#This will provide charactercount as an integer of how many characters are in the $emojibet output
    $charactercount = $emojibet | measure-object -Character |select -expandproperty characters
#Warning Popup follows if greater than 213 characters on output
if ($charactercount -gt '213' -and $charactercount -lt '1024')
    { 
    $ButtonType = [System.Windows.Forms.MessageBoxButtons]::OK
    $MessageIcon = [System.Windows.Forms.MessageBoxIcon]::Warning
    $MessageBody = "Warning - Your output is more than 213 characters long and may not be easily readable in Discord Channel Descriptions"
    $MessageTitle = "Emojibet Warning"
    $Result = [System.Windows.Forms.Messagebox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)}

if ($charactercount -gt '1024')
    { 
    $ButtonType = [System.Windows.Forms.MessageBoxButtons]::RetryCancel 
    $MessageIcon = [System.Windows.Forms.MessageBoxIcon]::Stop
    $MessageBody = "Warning - Your output is more than 1024 characters long and is not usable on Discord"
    $MessageTitle = "Emojibet Warning"
    $Result = [System.Windows.Forms.Messagebox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)}


  
#GUI Popup after the conversion completes

Function ButtonGo_Click
{
    $textBoxDisplay.Text = ($emojibet)
}

#endOutputWindow

#region designer

[System.Windows.Forms.Application]::EnableVisualStyles()

$textBoxDisplay = New-Object 'System.Windows.Forms.TextBox'
$textBoxDisplay.Location = '20, 10'
$textBoxDisplay.Multiline = $true
$textBoxDisplay.Name = "textBoxDisplay"
$textBoxDisplay.Size = '220, 190'
$textBoxDisplay.TabIndex = 1
$textBoxDisplay.Text = "$emojibet"

$textBoxDisplay2 = New-Object 'System.Windows.Forms.Textbox'
$textBoxDisplay2.Location = '300, 180'
$textBoxDisplay2.Size = '30, 10'
$textboxDisplay2.Name = "textboxdisplay2"
$textBoxDisplay2.Text = $charactercount


$mainForm = New-Object 'System.Windows.Forms.Form'
$mainForm.Size = '380, 250'
$mainForm.Controls.Add($textBoxDisplay)
$mainForm.Controls.Add($textBoxDisplay2)
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.Name = "mainForm"
$mainForm.Text = "Emojibet"

#The below is the copy to clipboard functionality
$ClipboardButton = New-Object System.Windows.Forms.Button
$ClipboardButton.Location = New-Object System.Drawing.Size (250,50)
$ClipboardButton.Size = New-Object System.Drawing.Size (100,50)
$ClipboardButton.Text = "Copy to Clipboard"
$mainForm.Controls.Add($ClipboardButton)
$ClipboardButton.Add_Click($ClipboardButton_Click)

$ClipboardButton_Click= Set-Clipboard -Value $emojibet

#Adds the New Emojibet Button in on output window
$NewEmojibet = New-Object System.Windows.Forms.Button
$NewEmojibet.Location = New-Object System.Drawing.Size (250,100)
$NewEmojibet.Size = New-Object System.Drawing.Size (100,50)
$NewEmojibet.Text = "New Emojibet" 
$mainForm.Controls.Add($NewEmojibet)
$NewEmojibet.Add_Click($NewEmojibet_Click)

#endregion designer

cls
$CenterScreen = [System.Windows.Forms.FormStartPosition]::CenterScreen;
$mainform.StartPosition = $CenterScreen;
$mainForm.ShowDialog()
}
