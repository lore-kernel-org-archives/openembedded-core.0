Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QRWLQ-0005wJ-Ia
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 23:19:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4VLG64W019489
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 31 May 2011 14:16:07 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 31 May 2011 14:16:06 -0700
Message-ID: <4DE55A95.2090302@windriver.com>
Date: Tue, 31 May 2011 16:16:05 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306865217.git.scott.a.garman@intel.com>	<79A1BC44-8268-4177-BBC5-4A5B08BDC8B7@dominion.thruhere.net>	<4DE53C21.7020000@linux.intel.com>
	<4DE546AE.1090301@intel.com>
	<BANLkTimmP7rDQidBOBbA8TqVtHKMF7Bhuw@mail.gmail.com>
In-Reply-To: <BANLkTimmP7rDQidBOBbA8TqVtHKMF7Bhuw@mail.gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"poky@yoctoproject.org Project" <poky@yoctoproject.org>
Subject: Re: [poky] [PATCH 0/7] User/group creation at preinstall
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
X-List-Received-Date: Tue, 31 May 2011 21:19:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/31/11 2:57 PM, Otavio Salvador wrote:
> On Tue, May 31, 2011 at 19:51, Scott Garman <scott.a.garman@intel.com> wrote:
>> That said, I have no idea what criteria should be used to determine which
>> list to send things to, and I'm sure I'm not the only one. Is this
>> documented anywhere?
> 
> It seems to me that poky list ought to be not used anymore and patches
> to be send to oe-core as AFAIK Yocto will base on it. Am I missing
> anything?
> 
> This is really confusing. This is not just regarding mailing lists but
> also IRC channels :-/
> 

As I understand it, the intention is the Poky list is used for Poky specific
items or to discuss (from a Poky specific point of view) oe-core items.. I.e.
problems, issues, etc from the usage of oe-core within the Poky use.

The confusion currently comes from many of the oe-core items used to live in the
Poky domain, and no longer due.  Unfortunately this will take a bit of education
for folks who don't contribute daily so that they know which mailing list to use.

(In otherwords the Poky list still has it's place, but only for Poky specific
discussions.)

--Mark


