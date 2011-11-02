Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RLOr9-0003oL-0x
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 01:39:03 +0100
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 01 Nov 2011 17:32:53 -0700
Received: by faan26 with SMTP id n26so7392545faa.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 17:32:52 -0700 (PDT)
Received: by 10.223.81.196 with SMTP id y4mr4380739fak.6.1320193972056;
	Tue, 01 Nov 2011 17:32:52 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id y8sm1973485faj.10.2011.11.01.17.32.49
	(version=SSLv3 cipher=OTHER); Tue, 01 Nov 2011 17:32:51 -0700 (PDT)
Message-ID: <4EB08FAF.10701@intel.com>
Date: Tue, 01 Nov 2011 17:32:47 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319580412.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1319580412.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] documentation audit script
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
X-List-Received-Date: Wed, 02 Nov 2011 00:39:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/2011 03:12 PM, Scott Garman wrote:
> Hello,
>
> I've been using this script to perform audits of which packages
> are producing documentation, and feel it's long overdue for this
> to be added to the git tree. So here it is.
>
> The following changes since commit f586aaa8d00361a9597a546d665077c75cf4d520:
>
>    libxml-parser-perl, libxml-simple-perl, expat, sgmlspl-native, git: bump PR to rebuild after perl upgrade (2011-10-25 08:36:01 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib sgarman/docaudit-script
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/docaudit-script
>
> Scott Garman (1):
>    documentation-audit.sh: script for auditing documentation build
>      status
>
>   scripts/contrib/documentation-audit.sh |   92 ++++++++++++++++++++++++++++++++
>   1 files changed, 92 insertions(+), 0 deletions(-)
>   create mode 100755 scripts/contrib/documentation-audit.sh
>
Merged into OE-Core

Thanks
	Sau!



