Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMP3F-0002vX-V8
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 20:31:26 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 May 2011 11:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,226,1304319600"; 
   d="scan'208";a="3484227"
Received: from unknown (HELO [10.255.12.160]) ([10.255.12.160])
	by fmsmga001.fm.intel.com with ESMTP; 17 May 2011 11:28:31 -0700
Message-ID: <4DD2BE4F.6080709@linux.intel.com>
Date: Tue, 17 May 2011 11:28:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305553117.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305553117.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/1] remaining Upstream-Status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2011 18:31:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2011 06:40 AM, Zhai Edwin wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> Saul,
>      This is remaining Upstream-Status update, including libfm, screenshot, eggdbus, qemu_git...
>
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: gzhai/fix3
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix3
>
> Thanks,
>      Zhai Edwin<edwin.zhai@intel.com>
> ---
>
>
> Zhai Edwin (1):
>    Upstream-Status: Update patch upstream-status for libfm, eggdbus,
>      screenshot...
>
>   meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch    |    2 ++
>   meta/recipes-core/eggdbus/eggdbus/marshal.patch    |    2 ++
>   .../qemu/qemu-git/enable-i386-linux-user.patch     |    2 ++
>   meta/recipes-devtools/qemu/qemu-git/fix-nogl.patch |    2 ++
>   .../qemu/qemu-git/linker-flags.patch               |    3 +++
>   meta/recipes-devtools/qemu/qemu-git/no-strip.patch |    2 ++
>   .../qemu/qemu-git/qemu-git-qemugl-host.patch       |    2 ++
>   .../qemu/qemu-git/qemu-vmware-vga-depth.patch      |    3 +++
>   .../qemu-git/qemugl-allow-glxcontext-release.patch |    2 ++
>   .../gtk+/gtk+-2.12.7/filechooser-props.patch       |    2 ++
>   .../clutter-box2d/fix-disable-introspection.patch  |    2 ++
>   .../screenshot/files/fix_ldadd_order.patch         |    3 +++
>   .../libfm/libfm-0.1.14/use_deprecate_func.patch    |    2 ++
>   13 files changed, 29 insertions(+), 0 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into oe-core and poky

Thanks
	Sau!



