Return-Path: <s.christ@phytec.de>
Received: from root.phytec.de (mail.x-arc.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 643F460657
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 08:18:43 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id B1C11A0025F;
	Mon, 26 Oct 2015 09:19:01 +0100 (CET)
Received: from lws-christ ([172.16.11.109])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015102609184271-4119 ;
	Mon, 26 Oct 2015 09:18:42 +0100 
Date: Mon, 26 Oct 2015 09:18:38 +0100
From: Stefan Christ <s.christ@phytec.de>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20151026081837.GB3460@lws-christ>
References: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
	<1445242541-41638-2-git-send-email-s.christ@phytec.de>
	<CAP71Wjz2YEuj8qLEw63027bGcYKNAPOazv-8Rd+J5RQ2C50UKA@mail.gmail.com>
	<20151019090300.GC3869@lws-christ>
	<CAP71Wjzhq_UVTb0cZHWLs=FPp0YRseXb-Q0RyAQXjDAuKFFLuQ@mail.gmail.com>
	<20151019092110.GE3869@lws-christ>
	<CAP71WjyN5pvA_VjwDcGLh6ze5P+e7afM025tYp8dcx1f-cMgZg@mail.gmail.com>
	<CAJTo0La+TivBoTBVGoc6SE7PFU=M+Kfw42bOMPTthTqvNKb-cA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0La+TivBoTBVGoc6SE7PFU=M+Kfw42bOMPTthTqvNKb-cA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 26.10.2015 09:18:42,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 26.10.2015 09:18:42
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] linux-dtb.inc: fix detection of ending '.dts'
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
X-List-Received-Date: Mon, 26 Oct 2015 08:18:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,=20

On Fri, Oct 23, 2015 at 10:17:00PM +0100, Burton, Ross wrote:
> Hi Stefan,
>=20
> On 19 October 2015 at 10:46, Nicolas Dechesne <nicolas.dechesne@linaro.or=
g>
> wrote:
>=20
> > i (very) quickly looked at them..
> > #3, #4, #5 look sane.
> > #6, #7, i am not sure if this is worth doing this change.. we'll see
> > what others think about them..
> >
>=20
> Can you drop 1 and 2 and rebase the remaining patches?  The rest of the
> series doesn't apply if 1 and 2 are dropped.

Sure. I will send a v2.

Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards,
	Stefan Christ


