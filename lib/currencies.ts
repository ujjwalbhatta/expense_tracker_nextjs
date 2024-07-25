export const Currencies = [
  {
    value: "USD",
    label: "$ Dollar",
    locale: "en-US",
  },
  {
    value: "EUR",
    label: "€ Euro",
    locale: "de-DE",
  },
  {
    value: "GBP",
    label: "£ Pound",
    locale: "en-GB",
  },
  {
    value: "NPR",
    label: "₨ Rupee",
    locale: "ne-NP",
  },
];

export type Currency = (typeof Currencies)[0];
