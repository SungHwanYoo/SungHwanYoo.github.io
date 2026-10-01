(() => {
  const dialog = document.getElementById('cv-preview');
  if (!dialog || typeof dialog.showModal !== 'function') return;
  let opener;

  document.addEventListener('click', (event) => {
    const trigger = event.target.closest('[data-cv-open]');
    if (!trigger || event.button !== 0 || event.ctrlKey || event.metaKey || event.shiftKey || event.altKey) return;
    event.preventDefault();
    opener = trigger;
    dialog.querySelector('.cv-preview__body').scrollTop = 0;
    dialog.showModal();
    document.documentElement.classList.add('cv-preview-open');
  });

  dialog.querySelector('[data-cv-close]').addEventListener('click', () => dialog.close());
  dialog.addEventListener('click', (event) => {
    if (event.target !== dialog) return;
    const bounds = dialog.getBoundingClientRect();
    if (event.clientX < bounds.left || event.clientX > bounds.right || event.clientY < bounds.top || event.clientY > bounds.bottom) dialog.close();
  });
  dialog.addEventListener('close', () => {
    document.documentElement.classList.remove('cv-preview-open');
    if (opener) opener.focus();
  });
})();
