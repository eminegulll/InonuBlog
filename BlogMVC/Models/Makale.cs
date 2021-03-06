namespace BlogMVC.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Mvc;

    [Table("Makale")]
    public partial class Makale
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Makale()
        {
            Etikets = new HashSet<Etiket>();
        }

        public int MakaleId { get; set; }

        [StringLength(500)]
        public string Baslik { get; set; }
        [UIHint("tinymce_full_compressed"),AllowHtml]

        public string Icerik { get; set; }

        [StringLength(500)]
        public string Foto { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Tarih { get; set; }

        public int? KategoriID { get; set; }

        public int? UyeId { get; set; }

        public int? Okunma { get; set; }

        public virtual Kategori Kategori { get; set; }

        public virtual Uye Uye { get; set; }

        
        public virtual ICollection<Yorum> Yorums { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Etiket> Etikets { get; set; }
    }
}
