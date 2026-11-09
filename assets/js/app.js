// Show either the existing-anime selector or the new-anime fields.
function toggleAnimeForm() {
    const option = document.getElementById('anime_option');
    const existing = document.getElementById('existingAnime');
    const newAnime = document.getElementById('newAnime');
    const animeSelect = document.getElementById('anime_id');

    // This script is also loaded on edit_anime.php, where these controls do not exist.
    if (!option || !existing || !newAnime || !animeSelect) return;

    const addingNew = option.value === 'new';
    existing.classList.toggle('hidden-panel', addingNew);
    newAnime.classList.toggle('hidden-panel', !addingNew);
    animeSelect.required = !addingNew;
    animeSelect.disabled = addingNew;
}

// Click "Rate this anime" on a card to select it in the rating form.
document.addEventListener('click', function (event) {
    const link = event.target.closest('[data-select-anime]');
    if (!link) return;

    const option = document.getElementById('anime_option');
    const animeSelect = document.getElementById('anime_id');
    if (!option || !animeSelect) return;

    option.value = 'existing';
    toggleAnimeForm();
    animeSelect.value = link.dataset.selectAnime;
});

document.addEventListener('DOMContentLoaded', function () {
    const option = document.getElementById('anime_option');
    if (option) {
        option.addEventListener('change', toggleAnimeForm);
        toggleAnimeForm();
    }
});
