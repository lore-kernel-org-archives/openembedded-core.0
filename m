Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RBIsB-0006DC-Rv
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 06:14:24 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 04 Oct 2011 21:08:47 -0700
Received: by bke5 with SMTP id 5so1465036bke.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 21:08:46 -0700 (PDT)
Received: by 10.223.38.196 with SMTP id c4mr700583fae.32.1317787726160;
	Tue, 04 Oct 2011 21:08:46 -0700 (PDT)
Received: from [10.6.18.233] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id a7sm447924fam.22.2011.10.04.21.08.42
	(version=SSLv3 cipher=OTHER); Tue, 04 Oct 2011 21:08:45 -0700 (PDT)
Message-ID: <4E8BD848.90801@intel.com>
Date: Tue, 04 Oct 2011 21:08:40 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1317371971.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1317371971.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/1] oprofileui: Update SRCREV
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
X-List-Received-Date: Wed, 05 Oct 2011 04:14:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/30/2011 01:42 AM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> Hi,
> This patch update the oprofileui SRCREV to reflect following 2 patches already in upstream:
> migrate-from-gnomevfs-to-gio.patch&  dso_linking_change_build_fix.patch
>
> Pls. help to pull.
>
> Thanks,
> Edwin
>
> The following changes since commit 9d1db6cc928199f8ac4960e8d4648563ef141427:
>
>    python: fix sqlite RPATH issue (2011-09-29 16:57:30 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/master2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
>
> Zhai Edwin (1):
>    oprofileui: Update SRCREV to reflect recent accpeted patches by
>      upstream
>
>   meta/recipes-kernel/oprofile/oprofileui_git.bb |    8 +++-----
>   1 files changed, 3 insertions(+), 5 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into OE-Core

Thanks
	Sau!



