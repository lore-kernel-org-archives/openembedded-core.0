Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKvAC-0000a0-Gn
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Apr 2012 19:29:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Apr 2012 10:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="143710387"
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by fmsmga001.fm.intel.com with ESMTP; 19 Apr 2012 10:19:26 -0700
Message-ID: <4F90491E.2020108@linux.intel.com>
Date: Thu, 19 Apr 2012 10:19:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334751924.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1334751924.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 0/1][PULL] Hob: Workaround for RPM architecture renaming issue
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
X-List-Received-Date: Thu, 19 Apr 2012 17:29:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/18/2012 05:48 AM, Dongxiao Xu wrote:
> Hi Richard,
>
> This pull request contains a workaround for RPM architecture renaming issue.
>
> Please help to review and pull.
>
> Thanks,
> Dongxiao
>
> The following changes since commit 48ef8dbb0d1bdbc7e0e62665b5112282637f3266:
>
>    lsb: Fix PR bump, fix bashisms, correct dependency issue, tweak package description (2012-04-18 12:06:48 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dxu4/hob-bugfix-oecore
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-bugfix-oecore
>
> Dongxiao Xu (1):
>    packageinfo.bbclass: A workaround for RPM architecture renaming
>
>   meta/classes/packageinfo.bbclass |   13 ++++++++++++-
>   1 files changed, 12 insertions(+), 1 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


