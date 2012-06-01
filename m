Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SaLu4-00010o-ID
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 09:04:08 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 May 2012 23:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106607301"
Received: from unknown (HELO [10.239.35.5]) ([10.239.35.5])
	by AZSMGA002.ch.intel.com with ESMTP; 31 May 2012 23:53:41 -0700
Message-ID: <4FC866F4.5060706@linux.intel.com>
Date: Thu, 31 May 2012 23:53:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1338395048.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1338395048.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] bitbake.conf: set an exclusion list for varflags in checksums
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
X-List-Received-Date: Fri, 01 Jun 2012 07:04:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/30/2012 09:25 AM, Paul Eggleton wrote:
> This is the OE-Core change corresponding to the varflags change just
> sent to the bitbake-devel list.
>
>
> The following changes since commit f5356062443320c29a19cfd7113128caa185b221:
>
>    Revert "meta: replace os.popen with subprocess.Popen" (2012-05-30 14:20:04 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/varflags
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/varflags
>
> Paul Eggleton (1):
>    bitbake.conf: set an exclusion list for varflags in checksums
>
>   meta/conf/bitbake.conf |    4 ++++
>   1 file changed, 4 insertions(+)
>
Merged into OE-Core

Thanks
	Sau!


