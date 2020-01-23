Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id BAAD47FD53
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 87AC09C00B9;
	Thu, 23 Jan 2020 09:31:41 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id ICvY-udKog1y; Thu, 23 Jan 2020 09:31:41 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 0735E9C0293;
	Thu, 23 Jan 2020 09:31:41 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id SJBYdzd8Pvkj; Thu, 23 Jan 2020 09:31:40 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DCB119C00B9;
	Thu, 23 Jan 2020 09:31:40 -0500 (EST)
Date: Thu, 23 Jan 2020 09:31:40 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <803384912.2168243.1579789900858.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <8c30e0dd-0517-6ccb-40b9-82a9ff93f639@intel.com>
References: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
	<8c30e0dd-0517-6ccb-40b9-82a9ff93f639@intel.com>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC79 (Linux)/8.8.11_GA_3737)
Thread-Topic: Connectivity check uris
Thread-Index: zE5wAA5DTmDwd2C47bMpcGBjSWLwxg==
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Connectivity check uris
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
X-List-Received-Date: Thu, 23 Jan 2020 14:31:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Jan 23, 2020, at 2:56 PM, Ross Burton ross.burton@intel.com wrote:
> On 23/01/2020 13:14, Jean-Marie LEMETAYER wrote:
>> So "example.com" is clearly not a good domain to do connectivity checks.
>> 
>> The "openembedded.org" domain is good but have a slow response time.
>> 
>> And finally "google.com" which have all sort of speedy networking stuff is very
>> efficient.
> 
> Oh my domestic ADSL in the UK I ran your script, example.com finished in
> 1 minute with 100/100.  What internet connectivity to you have?  The
> performance hit with the OE servers isn't ideal, and Google isn't
> suitable as has been said.

I have a fiber connection in france ... and the example.com server seems to be in the US.

But my best score is 56% :(





