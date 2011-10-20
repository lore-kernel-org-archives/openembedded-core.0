Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGwPr-0007dC-Kq
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:28:27 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 20 Oct 2011 10:22:34 -0700
Received: by wwe6 with SMTP id 6so3138478wwe.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 10:22:32 -0700 (PDT)
Received: by 10.216.133.160 with SMTP id q32mr8712185wei.108.1319131352871;
	Thu, 20 Oct 2011 10:22:32 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id k26sm16762651wbo.16.2011.10.20.10.22.30
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 10:22:32 -0700 (PDT)
Message-ID: <4EA058D5.30307@intel.com>
Date: Thu, 20 Oct 2011 10:22:29 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318856652.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1318856652.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/1] Make src_distribute to work
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
X-List-Received-Date: Thu, 20 Oct 2011 17:28:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2011 06:04 AM, Otavio Salvador wrote:
> The following changes since commit f2dada2079b5f98e13d4888609368ba111967a60:
>
>    lsb: Change link of ${baselib} to lib64 for 64bits system (2011-10-17 13:42:03 +0100)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (1):
>    src_distribute.bbclass, src_distribute_local.bbclass: mostly
>      rewritten
>
>   meta/classes/src_distribute.bbclass       |   54 ++++++++++++++++++++---------
>   meta/classes/src_distribute_local.bbclass |   28 ++++++++-------
>   2 files changed, 52 insertions(+), 30 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



