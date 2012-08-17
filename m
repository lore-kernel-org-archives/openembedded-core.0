Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2V8C-0002FA-2D
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 00:35:04 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Aug 2012 15:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,788,1336374000"; d="scan'208";a="135556535"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 15:23:03 -0700
Message-ID: <502EC447.50602@linux.intel.com>
Date: Fri, 17 Aug 2012 15:23:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1345155622.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345155622.git.andrei@gherzan.ro>
Subject: Re: [V2 PATCH 0/1] Inherit gettext in subversion
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 22:35:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2012 03:22 PM, Andrei Gherzan wrote:
> V2:
> Send the version of din patch where gettext is inherited
>
> The following changes since commit af847d36375aa53f0c1ee2a00c97ba9f38837d1b:
>
>    bitbake: bitbake: build.py: Add stampdir argument to cached_mtime_noerror (2012-08-16 12:27:41 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ag/fixes
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/fixes
>
> Andrei Gherzan (1):
>    subversion: Inherit gettext as msgfmt is needed at compile time
>
>   .../subversion/subversion_1.7.2.bb                 |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>

Merged into OE-Core

Thanks
	Sau!



