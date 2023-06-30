enum NavItemEnum { home, services, works, contact }

String getNavNmae(NavItemEnum item) {
  switch (item) {
    case NavItemEnum.home:
      return 'Home';
    case NavItemEnum.services:
      return 'Services';

    case NavItemEnum.works:
      return 'Project';

    case NavItemEnum.contact:
      return 'Contacts';
  }
}
