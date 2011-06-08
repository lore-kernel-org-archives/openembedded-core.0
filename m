Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QULwW-0007EZ-Sr
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 18:49:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jun 2011 09:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,339,1304319600"; d="scan'208";a="13585158"
Received: from unknown (HELO [10.255.13.55]) ([10.255.13.55])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2011 09:46:01 -0700
Message-ID: <4DEFA749.4090203@linux.intel.com>
Date: Wed, 08 Jun 2011 09:46:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307210880.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1307210880.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] distro tracking updates
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
X-List-Received-Date: Wed, 08 Jun 2011 16:49:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/04/2011 11:14 AM, Scott Garman wrote:
> This pull request updates some distro tracking fields and should
> quiet some manual check warnings the Yocto package reporting system
> has been sending me recently.
>
> The following changes since commit 6b5d323b6c8960a0999dbafa0422fe127fd0fa97:
>
>    event: don't catch systemexit from handler execution (2011-06-02 23:58:05 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/version-checks
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/version-checks
>
> Scott Garman (1):
>    distro-tracking: updates
>
>   .../conf/distro/include/distro_tracking_fields.inc |   34 +++++++++++--------
>   1 files changed, 20 insertions(+), 14 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into oe-core

Thanks
	Sau!


