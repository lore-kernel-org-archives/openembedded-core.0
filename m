Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMP02-0002rN-3a
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 20:28:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 May 2011 11:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,226,1304319600"; 
   d="scan'208";a="2918955"
Received: from unknown (HELO [10.255.12.160]) ([10.255.12.160])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2011 11:25:11 -0700
Message-ID: <4DD2BD87.2080307@linux.intel.com>
Date: Tue, 17 May 2011 11:25:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305570339.git.raj.khem@gmail.com>
In-Reply-To: <cover.1305570339.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/1] Bugfix in PRINC increment
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
X-List-Received-Date: Tue, 17 May 2011 18:28:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2011 11:26 AM, Khem Raj wrote:
>
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>    Branch: kraj/princ
>    Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/princ
>
> Thanks,
>      Khem Raj<raj.khem@gmail.com>
> ---
>
>
> Khem Raj (1):
>    base.bbclass: Fix PR increment bug when PR number is a single digit
>
>   meta/classes/base.bbclass |   19 ++++++-------------
>   1 files changed, 6 insertions(+), 13 deletions(-)
>
Merged into oe-core

Thanks
	Sau!



