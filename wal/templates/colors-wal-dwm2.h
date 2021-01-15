static char normfgcolor[]                = "{color15}";
static char normbgcolor[]                = "{color0}";
static char normbordercolor[]            = "{color8}";
static char normfloatcolor[]             = "#db8fd9";

static char selfgcolor[]                 = "{color15}";
static char selbgcolor[]                 = "{color2}";
static char selbordercolor[]             = "{color15}";
static char selfloatcolor[]              = "#005577";

static char titlenormfgcolor[]           = "{color15}";
static char titlenormbgcolor[]           = "{color0}";
static char titlenormbordercolor[]       = "{color8}";
static char titlenormfloatcolor[]        = "#db8fd9";

static char titleselfgcolor[]            = "{color15}";
static char titleselbgcolor[]            = "{color2}";
static char titleselbordercolor[]        = "{color15}";
static char titleselfloatcolor[]         = "#005577";

static char tagsnormfgcolor[]            = "{color15}";
static char tagsnormbgcolor[]            = "{color0}";
static char tagsnormbordercolor[]        = "{color15}";
static char tagsnormfloatcolor[]         = "#db8fd9";

static char tagsselfgcolor[]             = "{color15}";
static char tagsselbgcolor[]             = "{color2}";
static char tagsselbordercolor[]         = "{color15}";
static char tagsselfloatcolor[]          = "#005577";

static char hidfgcolor[]                 = "{color15}";
static char hidbgcolor[]                 = "{color2}";
static char hidbordercolor[]             = "{color15}";
static char hidfloatcolor[]              = "#f76e0c";

static char urgfgcolor[]                 = "{color15}";
static char urgbgcolor[]                 = "{color1}";
static char urgbordercolor[]             = "{color1}";
static char urgfloatcolor[]              = "#db8fd9";

static char *colors[][ColCount] = {
        /*                       fg                bg                border                float */
        [SchemeNorm]         = { normfgcolor,      normbgcolor,      normbordercolor,      normfloatcolor },
        [SchemeSel]          = { selfgcolor,       selbgcolor,       selbordercolor,       selfloatcolor },
        [SchemeTitleNorm]    = { titlenormfgcolor, titlenormbgcolor, titlenormbordercolor, titlenormfloatcolor },
        [SchemeTitleSel]     = { titleselfgcolor,  titleselbgcolor,  titleselbordercolor,  titleselfloatcolor },
        [SchemeTagsNorm]     = { tagsnormfgcolor,  tagsnormbgcolor,  tagsnormbordercolor,  tagsnormfloatcolor },
        [SchemeTagsSel]      = { tagsselfgcolor,   tagsselbgcolor,   tagsselbordercolor,   tagsselfloatcolor },
        [SchemeHid]          = { hidfgcolor,       hidbgcolor,       hidbordercolor,       hidfloatcolor },
        [SchemeUrg]          = { urgfgcolor,       urgbgcolor,       urgbordercolor,       urgfloatcolor },
};
