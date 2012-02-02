Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt12p-00012p-3F
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:06:03 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Feb 2012 09:58:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="103208069"
Received: from unknown (HELO [10.255.14.238]) ([10.255.14.238])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2012 09:58:05 -0800
Message-ID: <4F2ACEAC.4070507@linux.intel.com>
Date: Thu, 02 Feb 2012 09:58:04 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1327987354.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1327987354.git.jessica.zhang@intel.com>
Subject: Re: [PATCH 0/1] adt-installer tar ball regen issue with sstate
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
X-List-Received-Date: Thu, 02 Feb 2012 18:06:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2012 09:36 PM, Jessica Zhang wrote:
> The following changes since commit 08235ba0527a493fd652fdcbfded059c3a802333:
>    Jessica Zhang (1):
>          Merge branch 'master' of git://git.yoctoproject.org/poky
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib jzhang/adt-installer
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jzhang/adt-installer
>
> Jessica Zhang (1):
>    Fix the issue that adt-installer tar ball is not regenerated if
>      sstate is on, and other minor bug fixes
>
>   .../installer/adt-installer/adt_installer.conf     |    2 +-
>   .../installer/adt-installer_1.0.bb                 |   13 ++++++-------
>   2 files changed, 7 insertions(+), 8 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-core

Thanks
	Sau!


