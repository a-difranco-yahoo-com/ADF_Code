<?php

class Comic
{
    protected $Filename;
    protected $Title;
    protected $Volume;
    protected $Year;
    protected $Issue;
    protected $SubIssue;
    protected $SeriesRun;
    protected $BaseDirectory;
    protected $LetterDirectory;
    protected $TitleDirectory;
    protected $Rule;
	const     Drive = 'C:/';

/* Decompose Comic name to extract Title/Volume/Year/Extension */
public function __construct($comic_name)
{
  $this->Filename = $comic_name;
}

public function SetBaseDirectory($base_dir)
{
  $this->BaseDirectory = $base_dir;
}

public function GetBaseDirectory()
{
  return $this->BaseDirectory;
}

public function SetLetterDirectory($letter_dir)
{
  $this->LetterDirectory = $letter_dir;
}

public function GetLetterDirectory()
{
  return $this->LetterDirectory;
}

public function SetTitleDirectory($title_dir)
{
  $this->TitleDirectory = $title_dir;
}

public function GetTitleDirectory()
{
  return $this->TitleDirectory;
}

public function GetTargetDirectory()
{
    if ($this->DirectoryParsed() )
       return $this->BaseDirectory . "/" . $this->LetterDirectory . "/" . $this->TitleDirectory;
    else
       return "";
}

public function GetSourceFilename()
{
    return $this->BaseDirectory  . "/" . $this->Filename;
}

public function GetTargetFilename()
{
    if ($this->DirectoryParsed() )
       return $this->BaseDirectory  . "/" . $this->LetterDirectory . "/"
            . $this->TitleDirectory . "/" . $this->Filename;
    else
       return "";
}

public function GetVolume()    {    return $this->Volume;   }
public function GetTitle()     {    return $this->Title;    }
public function GetYear()      {    return $this->Year;     }
public function GetIssue()     {    return $this->Issue;    }
public function GetSubIssue()  {    return $this->SubIssue; }
public function GetSeriesRun() {    return $this->SeriesRun; }

private function ExtractTitleDirectory()
{
    if ($this->FilenameParsed() )
        return $this->Title . " (" . $this->Volume . ")";
    else
        return "";
}

private function ExtractLetterDirectory()
{
    if ($this->FilenameParsed() )
    {
        $LetterDirectory=substr($this->Filename, 0, 1);
        if ( $LetterDirectory >= "0" && $LetterDirectory <= "9" )
             $LetterDirectory  = "0";
        if ( $LetterDirectory >= "a" && $LetterDirectory <= "z" )
             $LetterDirectory  = strtoupper($LetterDirectory);
        return $LetterDirectory;
    } else
        return "";
}

public function ParseFilename()
{
  if ( preg_match("/(.*) V([0-9]{4}) #(.*) \(of ([0-9]*)\) \(([0-9]{4})\)(.cbz)/", $this->Filename, $matches) ) {
    $this->Title     = $matches[1];
    $this->Volume    = $matches[2];
    $IssueDetails    = $matches[3];
    $this->SeriesRun = $matches[4];
    $this->Year      = $matches[5];
    $this->Rule      = 100;
  } elseif ( preg_match("/(.*) V([0-9]{4}) #(.*) \(([0-9]{4})\)(.cbz)/", $this->Filename, $matches) ) {
    $this->Title     = $matches[1];
    $this->Volume    = $matches[2];
    $IssueDetails    = $matches[3];
    $this->Year      = $matches[4];
    $this->Rule      = 200;
  } else {
     echo("Failed to parse : " . $this->Filename . "\n");
  }
	
  if ( preg_match("/^([\-]*[0-9]*)$/", $IssueDetails, $matches) ) {
    $this->Issue     = $matches[1];
    $this->Rule     += 1;
  } elseif ( preg_match("/^([0-9]*)[\-\.](.*)$/", $IssueDetails, $matches) ) {
    $this->Issue     = $matches[1];
    $this->SubIssue  = $matches[2];
    $this->Rule     += 2;
  } elseif ( preg_match("/^([0-9]*)([^0-9]*)$/", $IssueDetails, $matches) ) {
    $this->Issue     = $matches[1];
    $this->SubIssue  = $matches[2];
    $this->Rule     += 3;
  } else {
     echo("Failed to parse issue : " . $this->Filename . " " . $IssueDetails . "\n");
  }
}

public function ParseDirectory()
{
    if ($this->FilenameParsed() )
    {
        $this->LetterDirectory=$this->ExtractLetterDirectory();
        $this->TitleDirectory=$this->ExtractTitleDirectory();
    }
}

private function FilenameParsed()
{
   return ($this->Title != "" && $this->Volume != "");
}

private function DirectoryParsed()
{
   return ($this->LetterDirectory != "" && $this->TitleDirectory != "");
}

private function ActualDirectoryExists()
{
    if ($this->DirectoryParsed() )
       return is_dir( $this->GetTargetDirectory() );
    else
       return FALSE;
}

private function ActualFileExists()
{
    if ($this->DirectoryParsed() )
       return is_file( $this->GetTargetFilename() );
    else
       return FALSE;
}

public function CheckDirectory()
{
    if ($this->FilenameParsed() && $this->DirectoryParsed() )
    {
        if ( $this->LetterDirectory != $this->ExtractLetterDirectory() ||
             $this->TitleDirectory  != $this->ExtractTitleDirectory() )
        {
           echo("$this->Filename \n");
           echo("$this->LetterDirectory \n");
           echo("$this->TitleDirectory \n");
           echo("\n");
           echo($this->ExtractLetterDirectory() . "\n");
           echo($this->ExtractTitleDirectory() . "\n");
           echo("--------------------------------\n");
        }
    }
}

public function MoveToTarget()
{
   if ($this->FilenameParsed() && $this->DirectoryParsed() )
   {
      $SrcFile = $this->GetSourceFilename();
      $TgtFile = $this->GetTargetFilename();
      $TgtDir  = $this->GetTargetDirectory();

      if ( ! $this->ActualDirectoryExists() )
          if ( ! mkdir("$TgtDir") )
             exit("ERROR: Failed to create $TgtDir\n");

      if ( $this->ActualFileExists() )
         echo("Exists $this->Filename \n");
      else
         rename("$SrcFile", "$TgtFile");
   }
}

public function PrintDetails()
{
    echo("Filename  = $this->Filename \n");
    echo("Title     = $this->Title \n");
    echo("Volume    = $this->Volume \n");
    echo("Year      = $this->Year \n");
    echo("Issue     = $this->Issue \n");
    echo("SubIssue  = $this->SubIssue \n");
    echo("SeriesRun = $this->SeriesRun \n");
    echo("Rule      = $this->Rule \n");
    echo("\n");
}

}
?>
