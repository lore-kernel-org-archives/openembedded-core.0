Return-Path: <max@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 024C97490C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 19:07:48 +0000 (UTC)
Received: by swift.blarg.de (Postfix, from userid 500)
	id C562722050E; Thu, 20 Sep 2018 21:07:49 +0200 (CEST)
Date: Thu, 20 Sep 2018 21:07:49 +0200
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180920190749.vzhy3vbpfel34vk3@swift.blarg.de>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <20180920183259.29310.24354@do.openembedded.org>
	<20180920190259.13842.60331@do.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20180920190259.13842.60331@do.openembedded.org>
User-Agent: NeoMutt/20170113 (1.7.2)
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
X-List-Received-Date: Thu, 20 Sep 2018 19:07:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2018/09/20 21:02, Patchwork <patchwork@patchwork.openembedded.org> wrote:
> * Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
>   Suggested fix    Sign off the added patch file (meta/recipes-connectivity/openssh/openssh/fix_without-openssl.patch)
> 
> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format] 
>   Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-connectivity/openssh/openssh/fix_without-openssl.patch
>   Standard format  Upstream-Status: <Valid status>
>   Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]

Hmm, both is present in my (newest) patch.

 https://patchwork.openembedded.org/patch/155025/

Can somebody explain this Patchwork failure to me?

Max

