<div {{ $attributes->merge(['class' => 'bg-white shadow overflow-hidden md:rounded-lg col-span-1']) }}>
    @if(isset($title))
        <div class="bg-white px-4 py-5 border-b border-gray-200 py-5 px-4 sm:px-6 lg:px-8">
            <h3 class="text-lg leading-3 font-medium text-gray-900">
                {{ $title }}
            </h3>
        </div>
    @endif
    <div class="border-t border-gray-200 py-5 px-4 sm:px-6 lg:px-8">
        {{ $slot }}
    </div>
</div>
