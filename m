Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUkEV-0006BR-NK
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 20:45:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jun 2011 11:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,342,1304319600"; d="scan'208";a="16293636"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2011 11:42:11 -0700
Message-ID: <4DF11403.8090800@linux.intel.com>
Date: Thu, 09 Jun 2011 11:42:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307595269.git.lei.mei@intel.com>
In-Reply-To: <cover.1307595269.git.lei.mei@intel.com>
Subject: Re: [PATCH 0/1]distro_tracking_fields.inc: Fix a date issue
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
X-List-Received-Date: Thu, 09 Jun 2011 18:45:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2011 10:01 PM, Mei Lei wrote:
> Hi Saul,
> 	This patch fix a little date issue in distro_tracking_fields.inc.
>
> Thanks
> Lei
>
> The following changes since commit a702c3dbf5fdc88eefdadd1f6c4cd6e04811c1e1:
>    Richard Purdie (1):
>          bitbake-layers: Fixup after recent server changes
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib lmei3/distro_date_issue
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/distro_date_issue
>
> Mei Lei (1):
>    distro_tracking_fields.inc: Fix a incorrect date format
>
>   .../conf/distro/include/distro_tracking_fields.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
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


