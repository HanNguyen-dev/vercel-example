import { fetchFilteredCustomers } from '@/app/lib/data';
import CustomersTable from '@/app/ui/customers/table';

export default async function Page({ query }: { query: string }) {
  const customers = await fetchFilteredCustomers(query);

  return (
    <div>
      <CustomersTable customers={customers} />
    </div>
  );
}
