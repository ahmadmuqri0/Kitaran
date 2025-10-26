export interface BreadcrumbItem {
  title: string;
  href: string;
}
export interface NavItem {
  title: string;
  url: string;
  icon: any;
  isActive?: boolean;
  items?: {
    title: string;
    url: string;
  }[];
}
[];

export interface User {
  name: string;
  email: string;
  avatar?: string;
}
