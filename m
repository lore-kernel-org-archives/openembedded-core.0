Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF7766011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 19:15:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9TJEUsF018127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Oct 2018 12:14:41 -0700
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 29 Oct 2018 12:14:20 -0700
To: Victor Kamensky <kamensky@cisco.com>
References: <20181026045303.10592-1-kamensky@cisco.com>
	<445EEF2D-ABF2-4822-A390-D6D7DECAC6B9@linux.intel.com>
	<alpine.LRH.2.00.1810260049050.5649@sjc-ads-6991.cisco.com>
	<19ff21b9-dab8-79af-7ffa-81af121ea65b@windriver.com>
	<alpine.LRH.2.00.1810290943390.62687@sjc-ads-6991.cisco.com>
From: Mark Hatle <mark.hatle@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	xsBNBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAHNJU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT7CwHcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrs7ATQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABwsBfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <5e6fa10e-5e7a-ce16-ec77-0363ca2fe037@windriver.com>
Date: Mon, 29 Oct 2018 14:14:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.00.1810290943390.62687@sjc-ads-6991.cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sysklogd: add alternatives for klogd and syslogd
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
X-List-Received-Date: Mon, 29 Oct 2018 19:15:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/29/18 1:27 PM, Victor Kamensky wrote:
> Hi Mark,
> 
> On Mon, 29 Oct 2018, Mark Hatle wrote:
> 
>> On 10/26/18 2:55 AM, Victor Kamensky wrote:
>>>
>>>
>>> On Fri, 26 Oct 2018, Markus Lehtonen wrote:
>>>
>>>> 'why would you want to have multiple, alternative
>>>> syslog daemons on the system? Wouldn't a better
>>>> fix be to move the syslogd and klogd symlinks to the
>>>> busybox-syslog package? It doesn't seem to make much
>>>> sense to have a syslogd binary on the system without
>>>> an init script(?)
>>>>
>>>> The original problem really was related to managing
>>>> init scripts with alternatives (and I think that
>>>> problem still persists, and, it shouldn't be done).
>>>> So, using alternatives for the binaries wouldn't
>>>> cause any problems. The question is just why to
>>>> do this, instead of "fixing" the (binary) package
>>>> content so that existing rconflicts would handle it.
>>>
>>> Thank you, Markus. Please see ChenQi reply on the
>>> thread. I has already been fixed by Richard in the
>>> way you suggested.
>>>
>>> My problem was because similar fix was not present
>>> in meta-selinux busybox.bbappend ... meta-selinux practically
>>> has a copy of alternative handling for busybox
>>> because of SELinux labeling requirements and it was
>>> negating Richard's change.
>>
>> As a maintainer for meta-selinux, if meta-selinux is broken.. it's
>> meta-selinux's fault.. NOT oe-core.
>> oe-core must work for itself first.
>>
>> Fix OE-core properly and the other layers will follow.
> 
> Please see
> 
> http://lists.openembedded.org/pipermail/openembedded-core/2018-October/157078.html
> 
> oe-core is fine: ef11c54ba9. In order to follow
> meta-selinux needs something like this to avoid
> 'update-alternatives: Error:' mentioned on the thead:

I'd not read that thread prior.  meta-selinux info should be sent to:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/tree/MAINTAINERS

"Please submit any patches against meta-selinux to the Yocto Project mailing
list (yocto@yoctoproject.org)."

But as I said before.. ignore meta-selinux for the purpose of fixing this.  If
it's broken, we fix it -right- in oe-core... and THEN we fix meta-selinux.  This
is the policy I follow for all layers.  oe-core first, layers in parallel or second.

Obviously if you know a layer has certain expectation (as you do here), it's
good to try to understand them and verify that any fix won't prevent the
required behavior -- but correctness in oe-core is the immediate priority.

--Mark

> From dd75b2ca77b3bfcb14030c353e6b2bfc7df8dfec Mon Sep 17 00:00:00 2001
> From: Victor Kamensky <kamensky@cisco.com>
> Date: Mon, 29 Oct 2018 11:16:09 -0700
> Subject: [PATCH] busybox: Put klogd/syslogd alternative links in syslog
>   package
> 
> Port "ef11c54ba9 busybox: Put klogd/syslogd alternative links in
> syslog package" from oe-core to meta-selinux copy of
> update-alternative handling in busybox.bbappend
> 
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ---
>   recipes-core/busybox/busybox_selinux.inc | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-core/busybox/busybox_selinux.inc b/recipes-core/busybox/busybox_selinux.inc
> index df7c117..b8cfcd7 100644
> --- a/recipes-core/busybox/busybox_selinux.inc
> +++ b/recipes-core/busybox/busybox_selinux.inc
> @@ -37,7 +37,11 @@ python create_sh_wrapper_reset_alternative_vars () {
>               # Match coreutils
>               if alt_name == '[':
>                   alt_name = 'lbracket'
> -            d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
> +            if alt_name == 'klogd' or alt_name == 'syslogd':
> +                d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' ' + alt_name)
> +            else:
> +                d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
> +
>               d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
>               if os.path.exists(alt_wppath_dest):
>                   d.setVarFlag('ALTERNATIVE_TARGET', alt_name, alt_wppath)
> 


