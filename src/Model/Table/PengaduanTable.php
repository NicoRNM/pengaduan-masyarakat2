<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query\SelectQuery;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * Pengaduan Model
 *
 * @method \App\Model\Entity\Pengaduan newEmptyEntity()
 * @method \App\Model\Entity\Pengaduan newEntity(array $data, array $options = [])
 * @method array<\App\Model\Entity\Pengaduan> newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\Pengaduan get(mixed $primaryKey, array|string $finder = 'all', \Psr\SimpleCache\CacheInterface|string|null $cache = null, \Closure|string|null $cacheKey = null, mixed ...$args)
 * @method \App\Model\Entity\Pengaduan findOrCreate($search, ?callable $callback = null, array $options = [])
 * @method \App\Model\Entity\Pengaduan patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method array<\App\Model\Entity\Pengaduan> patchEntities(iterable $entities, array $data, array $options = [])
 * @method \App\Model\Entity\Pengaduan|false save(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @method \App\Model\Entity\Pengaduan saveOrFail(\Cake\Datasource\EntityInterface $entity, array $options = [])
 * @method iterable<\App\Model\Entity\Pengaduan>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Pengaduan>|false saveMany(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\Pengaduan>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Pengaduan> saveManyOrFail(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\Pengaduan>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Pengaduan>|false deleteMany(iterable $entities, array $options = [])
 * @method iterable<\App\Model\Entity\Pengaduan>|\Cake\Datasource\ResultSetInterface<\App\Model\Entity\Pengaduan> deleteManyOrFail(iterable $entities, array $options = [])
 */
class PengaduanTable extends Table
{
    /**
     * Initialize method
     *
     * @param array<string, mixed> $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('pengaduan');
        $this->setDisplayField('isi_laporan');
        $this->setPrimaryKey('id');
    }

    /**
     * Default validation rules.
     *
     * @param \Cake\Validation\Validator $validator Validator instance.
     * @return \Cake\Validation\Validator
     */
    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->datetime('tg_pengaduan')
            ->requirePresence('tg_pengaduan', 'create')
            ->notEmptyDate('tg_pengaduan');

        $validator
            ->scalar('isi_laporan')
            ->maxLength('isi_laporan', 1000)
            ->requirePresence('isi_laporan', 'create')
            ->notEmptyString('isi_laporan');

        $validator
            ->scalar('foto')
            ->maxLength('foto', 255)
            ->requirePresence('foto', 'create')
            ->notEmptyString('foto');
         
            $validator
            ->allowEmptyFile('images')
            ->requirePresence('images', 'create')
            ->uploadedFile('images', [
                'type'=>[
                    'image/png',
                    'image/jpg',
                    'image/jpeg',

                ],
            ],'Allowed file exstension is: .png, .jpg, .jpeg,');
        $validator
            ->scalar('status')
            ->allowEmptyString('status');

        $validator
            ->integer('petugas_id')
            ->requirePresence('petugas_id', 'create')
            ->notEmptyString('petugas_id');



        return $validator;
    }
}
