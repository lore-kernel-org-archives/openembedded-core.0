Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RLOuy-0003x9-8m
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 01:43:00 +0100
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 01 Nov 2011 17:36:49 -0700
Received: by faan26 with SMTP id n26so7394753faa.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 17:36:48 -0700 (PDT)
Received: by 10.223.17.23 with SMTP id q23mr4364379faa.11.1320194208324;
	Tue, 01 Nov 2011 17:36:48 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id o16sm1951523fag.21.2011.11.01.17.36.45
	(version=SSLv3 cipher=OTHER); Tue, 01 Nov 2011 17:36:47 -0700 (PDT)
Message-ID: <4EB0909C.5020202@intel.com>
Date: Tue, 01 Nov 2011 17:36:44 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319510805.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1319510805.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/1] distro_tracking_fields: update packages tracking fields
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
X-List-Received-Date: Wed, 02 Nov 2011 00:43:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/2011 07:49 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> Update distro tracking fields for ccache, chkconfig.
>
> The following changes since commit 53ee27a1c5b589cba874f674c428e1a36557cc3b:
>    Joshua Lock (1):
>          doc: update manual for checksum changes
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/distro_tracking_fields_update
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/distro_tracking_fields_update
>
> Wenzong Fan (1):
>    distro_tracking_fields: update packages tracking fields
>
>   .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++++++++
>   1 files changed, 12 insertions(+), 0 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
This got pulled, but I still need a fix for Month format to MMM please

Thanks
	Sau!



