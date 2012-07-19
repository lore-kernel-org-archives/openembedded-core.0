Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Srw8H-0005rP-T6
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 21:11:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Jul 2012 12:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170509960"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by azsmga001.ch.intel.com with ESMTP; 19 Jul 2012 12:00:04 -0700
Message-ID: <50085933.8080801@linux.intel.com>
Date: Thu, 19 Jul 2012 12:00:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342635547.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1342635547.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/1] V2 add downloadfilename to wget fetcher
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
X-List-Received-Date: Thu, 19 Jul 2012 19:11:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


This should go to the bitbake-devel@lists.openembedded.org

Sau!


On 07/18/2012 11:21 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> In this V2 commit, not required changes from __init__.py are removed.
> Thanks,
> Nitin
>
> The following changes since commit 5b014eae151a1584df4e3d3b96d18f9df3e55665:
>
>    fix my typos in patch headers (2012-07-16 21:45:01 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/misc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>
> Nitin A Kamble (1):
>    bitbake wget fetcher: add parameter: downloadfilename
>
>   bitbake/lib/bb/fetch2/wget.py |    9 ++++++++-
>   1 files changed, 8 insertions(+), 1 deletions(-)
>



