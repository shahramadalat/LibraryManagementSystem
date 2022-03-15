using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementApplication.Models
{
    internal class Book
    {
        public int BookId { get; set; }
        public int? LanguageId { get; set; }
        public int? CategoreyId { get; set; }
        public string BookName { get; set; }
        public string Author { get; set; }
        public string Publishar { get; set; }
        public DateTime? PublishDate { get; set; }
        public string LanguageName { get; set; }
        public string CategoreyName { get; set; }
    }
}
