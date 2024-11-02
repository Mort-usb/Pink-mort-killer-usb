Add-Type -AssemblyName System.Windows.Forms
Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class DisplayHelper {
        [DllImport("user32.dll")]
        public static extern int ShowWindow(IntPtr hWnd, int nCmdShow);
    }
"@

$SW_MAXIMIZE = 3
$imagePath = "$PSScriptRoot\assets\pink_skull.jpg"  # Adjust path to assets folder

$image = [System.Drawing.Image]::FromFile($imagePath)

$form = New-Object System.Windows.Forms.Form
$form.Text = "Pink Skull Display"
$form.FormBorderStyle = 'None'
$form.WindowState = 'Maximized'
$form.BackColor = 'Black'

$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.Image = $image
$pictureBox.Dock = 'Fill'
$pictureBox.SizeMode = 'Zoom'
$form.Controls.Add($pictureBox)

[DisplayHelper]::ShowWindow($form.Handle, $SW_MAXIMIZE)

$form.KeyPreview = $true
$form.Add_KeyDown({})  # Disable all key presses
$form.ShowDialog()
