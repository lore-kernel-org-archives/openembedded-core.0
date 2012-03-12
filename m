Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S79NO-0004xv-T7
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 18:49:43 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Mar 2012 10:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="137531942"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2012 10:40:55 -0700
Message-ID: <4F5E3527.2030201@linux.intel.com>
Date: Mon, 12 Mar 2012 10:40:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331078069.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331078069.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] Formfactor fix
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
X-List-Received-Date: Mon, 12 Mar 2012 17:49:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2012 03:55 PM, Paul Eggleton wrote:
> The following change since commit d7b8c247227f3cc82f92292407f548927e9fde78:
>
>    base.bbclass: Fix PACKAGECONFIG handling when no flags are set (2012-03-05 13:03:41 -0800)
>
> is available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/formfactor
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/formfactor
>
> Paul Eggleton (1):
>    formfactor: use full path to fbset
>
>   meta/recipes-bsp/formfactor/files/config      |    6 +++---
>   meta/recipes-bsp/formfactor/formfactor_0.0.bb |    2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


