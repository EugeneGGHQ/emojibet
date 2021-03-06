
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
if ($emojibet.length -gt 213) {
    Add-Type -AssemblyName PresentationCore,PresentationFramework
    $ButtonType = [System.Windows.MessageBoxButton]::OK
    $MessageboxTitle = "Warning"
    $Messageboxbody = "Warning: The output is too long to be shown on a standard 2560px-wide monitor."
    $MessageIcon = [System.Windows.MessageBoxImage]::Warning
    [System.Windows.MessageBox]::Show($Messageboxbody,$MessageboxTitle,$ButtonType,$messageicon)
       }
#GUI Popup after the conversion completes

Function ButtonGo_Click
{
    $textBoxDisplay.Text = ($emojibet)
}

#endOutputWindow

#region designer

[System.Windows.Forms.Application]::EnableVisualStyles()

$textBoxDisplay = New-Object 'System.Windows.Forms.TextBox'
$textBoxDisplay.Location = '12, 50'
$textBoxDisplay.Multiline = $true
$textBoxDisplay.Name = "textBoxDisplay"
$textBoxDisplay.Size = '470, 150'
$textBoxDisplay.TabIndex = 1
$textBoxDisplay.Text = "$emojibet"

$mainForm = New-Object 'System.Windows.Forms.Form'
$mainForm.Size = '500, 250'
$mainForm.Controls.Add($textBoxDisplay)
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.Name = "mainForm"
$mainForm.Text = "Emojibet"

#endregion designer

cls
$CenterScreen = [System.Windows.Forms.FormStartPosition]::CenterScreen;
$mainform.StartPosition = $CenterScreen;
$mainForm.ShowDialog()
}
