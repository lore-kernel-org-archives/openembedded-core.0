Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RLzZC-0008Sw-BM
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 16:50:58 +0100
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 03 Nov 2011 08:44:47 -0700
Received: by wwi36 with SMTP id 36so1410479wwi.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 08:44:46 -0700 (PDT)
Received: by 10.227.203.132 with SMTP id fi4mr13051644wbb.6.1320335085959;
	Thu, 03 Nov 2011 08:44:45 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id fy21sm10883964wbb.5.2011.11.03.08.44.44
	(version=SSLv3 cipher=OTHER); Thu, 03 Nov 2011 08:44:45 -0700 (PDT)
Message-ID: <4EB2B6EA.6020400@intel.com>
Date: Thu, 03 Nov 2011 08:44:42 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320212931.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1320212931.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/1] distro_tracking_fields: Update the Month to 'MMM'
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
X-List-Received-Date: Thu, 03 Nov 2011 15:50:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2011 10:52 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> Update the format of Month to 'MMM' instead of spell it out.
>
> The following changes since commit 4a951e0433a99cd985515843f0a48fadc7050aca:
>    Robert P. J. Day (1):
>          Fix HOMEPAGE values in libzypp and sat-solver .bb files
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/distro_tracking_fields_update
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/distro_tracking_fields_update
>
> Wenzong Fan (1):
>    distro_tracking_fields: Update the Month to 'MMM'
>
>   .../conf/distro/include/distro_tracking_fields.inc |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
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


