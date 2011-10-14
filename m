Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1REkkW-0002SW-3P
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 18:36:44 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 14 Oct 2011 09:30:55 -0700
Received: by wyh11 with SMTP id 11so3192212wyh.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 09:30:53 -0700 (PDT)
Received: by 10.227.38.66 with SMTP id a2mr687924wbe.43.1318609852653;
	Fri, 14 Oct 2011 09:30:52 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id n21sm15121707wbp.2.2011.10.14.09.30.50
	(version=SSLv3 cipher=OTHER); Fri, 14 Oct 2011 09:30:51 -0700 (PDT)
Message-ID: <4E9863B8.50508@intel.com>
Date: Fri, 14 Oct 2011 09:30:48 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318281075.git.kergoth@gmail.com>
In-Reply-To: <cover.1318281075.git.kergoth@gmail.com>
Subject: Re: [PATCH 0/2] Minor autoconf & autotools.bbclass fixes (supercedes previous misc fixes request)
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
X-List-Received-Date: Fri, 14 Oct 2011 16:36:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2011 02:13 PM, Christopher Larson wrote:
> The following changes since commit 4732222c46652951e66aae377631f4a361179d8f:
>
>    Fix sysprof for powerpc64 (2011-10-10 09:54:03 +0100)
>
> are available in the git repository at:
>    http://github.com/kergoth/oe-core misc-fixes
>
> Christopher Larson (2):
>    autotools: fix multi-word arguments for EXTRA_OECONF
>    autoconf: no need to hardcode the full path to m4
>
>   meta/classes/autotools.bbclass                  |    6 ++----
>   meta/recipes-devtools/autoconf/autoconf_2.68.bb |    4 +++-
>   2 files changed, 5 insertions(+), 5 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!




