interface Help<T> {
  data: Array<T>;
}

export function HelpComp<T>(props: Help<T>) {
  return (
    <div>
      {props.data.map((value, index) => (
        <div key={index}>{typeof value === 'string' ? value : index}</div>
      ))}
    </div>
  );
}
