Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RJfGO-00047P-7p
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 07:45:56 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 27 Oct 2011 22:39:53 -0700
Received: by wyg24 with SMTP id 24so3636714wyg.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 22:39:52 -0700 (PDT)
Received: by 10.227.205.20 with SMTP id fo20mr1508359wbb.20.1319780392370;
	Thu, 27 Oct 2011 22:39:52 -0700 (PDT)
Received: from [10.192.3.184] ([85.13.70.251])
	by mx.google.com with ESMTPS id es5sm13389763wbb.11.2011.10.27.22.39.50
	(version=SSLv3 cipher=OTHER); Thu, 27 Oct 2011 22:39:51 -0700 (PDT)
Message-ID: <4EAA4025.2010709@intel.com>
Date: Fri, 28 Oct 2011 07:39:49 +0200
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319580412.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1319580412.git.scott.a.garman@intel.com>
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
X-List-Received-Date: Fri, 28 Oct 2011 05:45:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/2011 12:12 AM, Scott Garman wrote:
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

Can you please run this and generate a report.

Thanks
     Sau!


