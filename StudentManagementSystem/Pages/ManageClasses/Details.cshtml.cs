using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using StudentManagementSystem.Models;
using System.Threading.Tasks;

namespace StudentManagementSystem.Pages.ManageClasses
{
    public class DetailsModel : PageModel
    {
        private readonly PRN221_StudentManagementSystemContext _context;

        public DetailsModel(PRN221_StudentManagementSystemContext context)
        {
            _context = context;
        }

        public Class Class { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Class = await _context.Classes.FirstOrDefaultAsync(m => m.ClassId == id);

            if (Class == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
