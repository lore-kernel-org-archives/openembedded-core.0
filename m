Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6911A74775
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 21:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7E10731E3705
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 23:10:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id qIM-PaKtkv0D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 23:10:21 +0200 (CEST)
Received: from t460p (p4FD0F5EB.dip0.t-ipconnect.de [79.208.245.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B429031E3703
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 23:10:21 +0200 (CEST)
Date: Thu, 20 Sep 2018 23:10:20 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <20180920231020.6321b23a@t460p>
In-Reply-To: <20180920192920.z3kzcxbx3l4wg4pz@swift.blarg.de>
References: <20180920183259.29310.24354@do.openembedded.org>
	<20180920190259.13842.60331@do.openembedded.org>
	<20180920190749.vzhy3vbpfel34vk3@swift.blarg.de>
	<CAJ86T=VyGD1BAUouZ2UTxS8Qa1AMn=QvVbBdbqQS4n8dXkg=Gg@mail.gmail.com>
	<20180920192920.z3kzcxbx3l4wg4pz@swift.blarg.de>
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9wZW5zc2g6IG1ha2UgT3BlblNTTCBvcHRpb25hbCAocmV2Mik=?=
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
X-List-Received-Date: Thu, 20 Sep 2018 21:10:24 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Sep 2018 21:29:20 +0200
Max Kellermann <max+openembedded@blarg.de> wrote:

> On 2018/09/20 21:13, Andre McCurdy <armccurdy@gmail.com> wrote:
> > Try putting both tags at the start of a line rather than indenting.  
> 
> That's what "git show" does, which I used to generate the patch file.
> I'll resend without indent, thanks.

Try "git format-patch" instead.

Regards,
Andreas

