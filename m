Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RqUD6-0005Id-J4
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 19:38:12 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jan 2012 09:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116601553"
Received: from unknown (HELO [10.255.14.96]) ([10.255.14.96])
	by fmsmga002.fm.intel.com with ESMTP; 26 Jan 2012 09:12:12 -0800
Message-ID: <4F21896C.4080809@linux.intel.com>
Date: Thu, 26 Jan 2012 09:12:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1327091117-27468-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1327091117-27468-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] ltp: Update recipe and fix building on uclibc
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
X-List-Received-Date: Thu, 26 Jan 2012 18:38:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/20/2012 12:25 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../ltp/ltp/uclibc-getcontext.patch                |   78 ++++++++++++++++++++
>   .../ltp/{ltp_20110915.bb =>  ltp_20120104.bb}       |   10 +-
>   2 files changed, 83 insertions(+), 5 deletions(-)
>   create mode 100644 meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch
>   rename meta/recipes-extended/ltp/{ltp_20110915.bb =>  ltp_20120104.bb} (93%)
>

Merged into OE-Core

Thanks
	Sau!


