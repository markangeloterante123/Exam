<?php

namespace App\Services\Role;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Response;
use App\Models\Role;
use App\Traits\GlobalTrait;

class RoleService
{
    /**
     * @var GlobalTrait
     */
    use GlobalTrait;

    /**
     * RoleService index
     * @param  Request $request
     * @return Response
     */
    public function index ($request): Response
    {
        $roles = Role::select('id', 'name', 'identifier', 'created_at')
        ->withCount('users')
        ->when($request->filled('all'), function ($query) {
            return $query->get();
        }, function ($query) {
            return $query->paginate(20);
        });

        return response([
            'records' => $roles
        ]);
    }

    /**
     * RoleService store
     * @param  Request $request
     * @return Response
     */
    public function store ($request): Response
    {
        $validator = Validator::make($request->all(), [
            'name'        => 'required',
            'type'        => 'required|in:admin,editor,customer',
            'permissions' => 'required'
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $role = Role::create([
            'name'        => $request->name,
            'identifier'  => str_slug($request->identifier),
            'type'        => $request->type,
            'permissions' => $request->permissions
        ]);

        $this->generateLog($request->user(), "added this role ({$role->id}).");

        return response([
            'record' => $role
        ]);
    }

    /**
     * RoleService show
     * @param  Role $role
     * @param  Request $request
     * @return Response
     */
    public function show ($role, $request): Response
    {
        $this->generateLog($request->user(), "viewed this role ({$role->id}).");

        return response([
            'record' => $role
        ]);
    }

    /**
     * RoleService update
     * @param  Role $role
     * @param  Request $request
     * @return Response
     */
    public function update ($role, $request): Response
    {
        $validator = Validator::make($request->all(), [
            'name'        => 'required',
            'type'        => 'required|in:admin,editor,customer',
            'permissions' => 'required'
        ]);

        if ($validator->fails()) {
            return response([
                'errors' => $validator->errors()->all()
            ], 400);
        }

        $role->update([
            'name'        => $request->name,
            'identifier'  => str_slug($request->identifier),
            'type'        => $request->type,
            'permissions' => $request->permissions
        ]);

        $this->generateLog($request->user(), "updated this role ({$role->id}).");

        return response([
            'record' => $role
        ]);
    }

    /**
     * RoleService destroy
     * @param  Role $role
     * @param  Request $request
     * @return Response
     */
    public function destroy ($role, $request): Response
    {
        $role->delete();
        $this->generateLog($request->user(), "deleted this role ({$role->id}).");

        return response([
            'record' => 'Role deleted'
        ]);
    }
}
