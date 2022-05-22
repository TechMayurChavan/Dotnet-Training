﻿using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;

namespace Sample_Web_App.Models
{
    public class ProfileData
    {
        [Display(Name="Image")]
        public IFormFile ProfilePicture { get; set; }
        public string UploadStatus { get; set; }
        public string FileName { get; set; }
    }
}
