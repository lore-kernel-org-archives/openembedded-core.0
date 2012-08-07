Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1Syb2p-0000bV-Dl
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 06:05:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q773raeY019922
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Aug 2012 20:53:36 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.20.142) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 6 Aug 2012 20:53:35 -0700
Message-ID: <5020913E.2070306@windriver.com>
Date: Mon, 6 Aug 2012 23:53:34 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1344268492.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1344268492.git.dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/1] linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 07 Aug 2012 04:05:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-06 11:56 AM, Darren Hart wrote:
> The following changes since commit 47aca0f0f79c30d1df1f89c710d3e354f436145d:
>
>    subversion: Add missing build dependency on sqlite3 (2012-08-06 16:13:45 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/user-contrib/dvhart/oe-core skeleton
>    http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=skeleton
>
> Darren Hart (1):
>    linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE

Looks good to me.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
>   .../recipes-kernel/linux/linux-yocto-custom.bb     | 53 +++++++++++++++-------
>   1 file changed, 36 insertions(+), 17 deletions(-)
>



