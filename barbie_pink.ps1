Add-Type -AssemblyName System.Windows.Forms

# Define color and timeout duration
$barbiePink = [System.Drawing.Color]::FromArgb(255, 205, 0, 102)  # Barbie pink color
$displayTime = 7200  # Time in seconds (1 hour)

# Create a fullscreen form
$form = New-Object System.Windows.Forms.Form
$form.BackColor = $barbiePink
$form.FormBorderStyle = 'None'
$form.WindowState = 'Maximized'
$form.TopMost = $true

# Timer to close the form after the set duration
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = $displayTime * 1000  # Set interval in milliseconds
$timer.Add_Tick({ 
    $form.Close()
    [console]::beep(1000, 1000)  # Plays a 1-second beep at 1000 Hz frequency
})  
$timer.Start()

# Display the form
$form.ShowDialog()
