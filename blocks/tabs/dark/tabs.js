export default async function afterDecorate(block) {
  // show alert if the tab panels are switched
  const tabHeaders = block.querySelectorAll('.tabs .tabs-tab');
  console.log(tabHeaders);
  tabHeaders.forEach((header) => {
    header.addEventListener('click', () => {
      alert('Tab header clicked');
    });
  });
}
