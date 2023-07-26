require 'date'
require 'fileutils'

# Define a hash to map English month names to Portuguese
month_translation = {
  'January' => 'Janeiro',
  'February' => 'Fevereiro',
  'March' => 'Março',
  'April' => 'Abril',
  'May' => 'Maio',
  'June' => 'Junho',
  'July' => 'Julho',
  'August' => 'Agosto',
  'September' => 'Setembro',
  'October' => 'Outubro',
  'November' => 'Novembro',
  'December' => 'Dezembro'
}

# 1. Search for a file that contains "NFS-e" and "Datarisk" in the name within the Downloads directory
downloads_directory = File.expand_path('~/Downloads/')
nfse_files = Dir.glob(File.join(downloads_directory, '*NFS-e*Datarisk*'))

# Check if a file was found
if nfse_files.empty?
  puts "No file matching the criteria was found."
else
  # Assuming only one file matches the criteria
  file_to_move = nfse_files.first

  # Get the current month
  current_month = month_translation[Date.today.strftime('%B')]

  # 2. Move the file to the script's root directory
  script_root = File.expand_path(File.dirname(__FILE__))
  destination = File.join(script_root, File.basename(file_to_move))
  FileUtils.mv(file_to_move, destination, force: true)

  # 3. Rename the file to the desired format
  new_filename = "Tiago-Onofre_NFe_#{current_month}.PDF"
  new_filepath = File.join(script_root, new_filename)
  File.rename(destination, new_filepath)

  puts "File moved and renamed successfully."

   # 4. Convert the PDF to HTML using pdftohtml command
  output_file_prefix = File.join(script_root, "Tiago-Onofre_NFe_#{current_month}")
  command = "pdftohtml -xml #{new_filename} #{output_file_prefix}"
  system(command)
end
