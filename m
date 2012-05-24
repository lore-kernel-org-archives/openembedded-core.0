Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXcZa-0007nJ-8U
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 20:15:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 11:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156855687"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 11:05:29 -0700
Message-ID: <4FBE7869.7090309@linux.intel.com>
Date: Thu, 24 May 2012 11:05:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337729156.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1337729156.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] Implement file checksums (OE-Core part)
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
X-List-Received-Date: Thu, 24 May 2012 18:15:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2012 04:27 PM, Paul Eggleton wrote:
> The remaining third of the changes to implement local file checksums -
> the other 2/3 are against BitBake and have been sent to the
> bitbake-devel mailing list.
>
>
> The following change since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:
>
>    tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)
>
> is available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/file-checksum-oecore
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/file-checksum-oecore
>
> Paul Eggleton (1):
>    classes/base: add checksum file list at parse time
>
>   meta/classes/base.bbclass |    1 +
>   1 file changed, 1 insertion(+)
>

Merged into OE-Core

Thanks
	Sau!



