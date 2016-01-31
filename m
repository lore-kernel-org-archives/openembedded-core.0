Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9BC760B0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 16:14:25 +0000 (UTC)
Received: from [212.183.132.77] (helo=e130)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aPudt-000127-04; Sun, 31 Jan 2016 17:14:25 +0100
Message-ID: <1454256830.7421.19.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 31 Jan 2016 16:13:50 +0000
In-Reply-To: <1454246466.27087.12.camel@linuxfoundation.org>
References: <1454246466.27087.12.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Use target provided zlib
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
X-List-Received-Date: Sun, 31 Jan 2016 16:14:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-01-31 at 13:21 +0000, Richard Purdie wrote:
> When using -fpic (security related cflags),

Do you mean -fpie?

p.



