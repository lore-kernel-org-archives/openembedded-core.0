Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id E8BEA6025F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 10:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 42CAE31A5A55;
	Tue,  8 Nov 2016 11:00:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id gINgwNvHtszi; Tue,  8 Nov 2016 11:00:15 +0100 (CET)
Received: from [172.22.22.61] (55d4038b.access.ecotel.net [85.212.3.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id AE60931A5A58;
	Tue,  8 Nov 2016 11:00:11 +0100 (CET)
To: "Jolley, Stephen K" <stephen.k.jolley@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E572AE52E@fmsmsx111.amr.corp.intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <e188c300-ce1b-4591-cb87-81a1497bbf34@opendreambox.org>
Date: Tue, 8 Nov 2016 11:00:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <9ADD3FDE8B189B4AA2F8A3C711F8155E572AE52E@fmsmsx111.amr.corp.intel.com>
Subject: Re: Yocto Project Status WW45 - UPDATED
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Nov 2016 10:00:23 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hello Stephen,

On 04.11.2016 18:06, Jolley, Stephen K wrote:
> ·        There was a challenging taskhash mismatch test case this week
> which has resulted in some significant debugging improvements for
> taskhashes and basehashes which are now in master.

is there an entry in bugzilla about this issue, or can you please add a
reference to the actual commits in master? I'm facing a similar issue,
so it might be helpful for me to backport them to the branch I'm using.

Regards,
Andreas

