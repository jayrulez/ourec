using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Fakebook.Models.Repository;

namespace Fakebook.Models.Provider
{
    public class BaseRepository : IBaseRepository
    {
		protected Entities dbContext;
		
		public BaseRepository()
		{
			this.dbContext = new Entities();
		}
    }
}
